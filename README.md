## Git Hooks (powered by [overcommit][1])

```sh
$ bundle exec overcommit --install
```

This project uses two hooks:

1. `pre-push` -- it runs `rspec` before you push. Your push is rejected if one
   or more tests fail. Please fix all failing tests and try again.
2. `pre-commit` -- it runs `rubocop` to lint and style-check the entire
   codebase. Your commit is rejected if `rubocop` detected any offenses. Please
   fix all offenses and try again.

[1]: https://github.com/brigade/overcommit
