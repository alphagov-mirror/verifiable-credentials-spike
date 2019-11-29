class VerifiablePresentation
  include Proof

  def initialize(credential)
    @credential = credential
  end

  def build
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1"
      ],
      "type": "VerifiablePresentation",
      "id": "https://example.org/credentials/1234",
      "verifiableCredential": [credential]
    }
  end

  def attach_proof(payload)
    proof_options = create_proof
    proof_options.merge("challenge": create_signature(payload, proof_options))
    payload.merge("proof": [proof_options])
  end

private

  attr_reader :credential

end

