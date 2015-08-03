# Shore git prepare-commit-msg hook
#
# Autom. prepends git commit messages with ticket type and ticket id based on
# the current branch name (assuming naming convention has been followed).
#
# Naming convention for branches:
# {ticket type}/{ticket id}-{ticket title in param-case}
# Ex: feature/COR-42-the-meaning-of-life
# Ex: chore/BOK-23-refactor-everything
# Ex: bug/WAC-667-neighbor-of-the-beast
# Ex: task/COR-668-foo-bar-baz
#
# Only applies when using:
# $ git ci -m "message"
# $ git ci -F path/to/message.txt
# $ git ci
#
# Except it is a:
# - merge commit
# - squash commit
#
# Example:
# assuming current branch name is: feature/COR-1-some-ticket-title
# $ git commit -m "did some stuff"
# commit message is now: F [#COR-1] did some stuff
module Overcommit
  module Hook
    module CommitMsg
      VALID_TICKET_TYPES = %w(feature chore bug task)

      class AddTicketId < Base
        def run
          branch_name = `git symbolic-ref --short HEAD`
          ticket_type, ticket_id = branch_name.scan(/(\w+)\/(\w+-\d+)/).flatten
          may_apply_hook =
            VALID_TICKET_TYPES.include?(ticket_type) &&
            ticket_id &&
            [nil, 'message'].include?(ARGV[1])

          if may_apply_hook
            prefix = "#{ticket_type[0].upcase} [##{ticket_id.upcase}] "
            # Skip if commit Ticket ID is already present (this fixes a problem
            # with `git commit --amend`).
            unless commit_message.start_with?(prefix)
              `sed -i.bak -e "1s/^/#{prefix}/" #{commit_message_file}`
            end
          end

          :pass
        end
      end
    end
  end
end
