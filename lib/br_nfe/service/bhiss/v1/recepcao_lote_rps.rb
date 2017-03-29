module BrNfe
	module Service
		module Bhiss
			module V1
				class RecepcaoLoteRps < BrNfe::Service::Bhiss::V1::Base
					include BrNfe::Service::Concerns::Rules::RecepcaoLoteRps

					def certificado_obrigatorio?
						true
					end

					def method_wsdl
						:recepcionar_lote_rps
					end

					# Tag root da requisição
					def soap_body_root_tag
						'RecepcionarLoteRpsRequest'
					end

					def xml_builder
						xml = render_xml 'servico_enviar_lote_rps_envio'
						sign_nodes = [
							{
								node_path: "//EnviarLoteRpsEnvio/LoteRps",
								node_ids: ["#{numero_lote_rps}"]
							},
							{
								node_path: "//EnviarLoteRpsEnvio/LoteRps/ListaRps/Rps/InfRps",
								node_ids: lote_rps.map{|rps| "rps:#{rps.numero}"}
							}
						]
						sign_xml(xml, sign_nodes).gsub("<?xml version=\"1.0\"?>", "").strip
					end

				private
					def response_class
						BrNfe::Service::Response::RecepcaoLoteRps
					end

					def set_response
						@response = BrNfe::Service::Response::Build::RecepcaoLoteRps.new(
							savon_response: @original_response, # Rsposta da requisição SOAP
							keys_root_path: [],
							body_xml_path:  [:recepcionar_lote_rps_response, :return],
							xml_encode:     response_encoding, # Codificação do xml de resposta
						).response
					end
				end
			end
		end
	end
end
