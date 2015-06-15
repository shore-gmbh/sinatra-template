json.meta do
  json.current_page @documents.current_page
  json.total_pages @documents.total_pages
  json.per_page @documents.count
end

json.documents @documents do |document|
  json.partial! 'document', document: document
end
