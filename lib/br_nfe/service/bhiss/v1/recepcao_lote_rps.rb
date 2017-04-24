module BrNfe
	module Service
		module Bhiss
			module V1
				class RecepcaoLoteRps < BrNfe::Service::Bhiss::V1::Base
					include BrNfe::Service::Concerns::Rules::RecepcaoLoteRps

					def lote_rps_fixed_attributes
						{versao: "1.00"}
					end

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
								node_path: "//nf:EnviarLoteRpsEnvio/nf:LoteRps/nf:ListaRps/nf:Rps/nf:InfRps",
							  node_namespaces: {nf: 'http://www.abrasf.org.br/nfse.xsd'},
								# node_path: "//EnviarLoteRpsEnvio/LoteRps/ListaRps/Rps/InfRps",
								# node_namespaces: {nf: 'http://www.abrasf.org.br/ABRASF/arquivos/nfse.xsd'},
								node_ids: lote_rps.map{|rps| "rps:#{rps.numero}"}
							},
							{
								# node_path: "//nfseDadosMsg/EnviarLoteRpsEnvio/LoteRps",
								# node_namespaces: {nf: 'http://www.abrasf.org.br/ABRASF/arquivos/nfse.xsd'},
								node_path: "//nf:EnviarLoteRpsEnvio/nf:LoteRps",
							  node_namespaces: {nf: 'http://www.abrasf.org.br/nfse.xsd'},
								node_ids: ["#{numero_lote_rps}"]
							}
						]
						# sign_xml('<?xml version="1.0" encoding="ISO-8859-1"?>'+xml)
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
							body_xml_path:  [:enviar_lote_rps_resposta, :recepcionar_lote_rps_response, :return],
							xml_encode:     response_encoding, # Codificação do xml de resposta
						).response
					end
				end
			end
		end
	end
end