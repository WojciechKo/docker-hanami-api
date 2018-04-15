class RackResponse
  def self.error(status, error)
    response_obj = { status: status,
                     error: "#{error}" }
    [
      status,
      { "Content-Type" => "application/json" },
      [response_obj.to_json]
    ]
  end
end
