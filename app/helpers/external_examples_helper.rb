module ExternalExamplesHelper
  def delete_external_example(id, kata)
    text = t(:delete)
    link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "btn btn-danger"})
  end
end
