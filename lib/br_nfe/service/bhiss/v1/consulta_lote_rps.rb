module BrNfe
	module Service
		module Bhiss
			module V1
				class ConsultaLoteRps < BrNfe::Service::Bhiss::V1::Base
					include BrNfe::Service::Concerns::Rules::ConsultaNfse

					attr_accessor :protocolo
					validates :protocolo, presence: true

					def method_wsdl
						:consultar_lote_rps
					end

					def xml_builder
            $enviando_rps = false
						render_xml 'servico_consultar_lote_rps_envio'
					end

					# Tag root da requisição
					#
					def soap_body_root_tag
						'ConsultarLoteRpsRequest'
					end

				private
					# Não é utilizado o keys_root_path pois
					# esse órgão emissor trata o XML de forma diferente,
					# e para instanciar a resposta adequadamente é utilizado o
					# body_xml_path.
					# A resposta contém outro XML dentro do Body.
					#
					def set_response
						@response = BrNfe::Service::Response::Build::ConsultaLoteRps.new(
							savon_response:       @original_response, # Rsposta da requisição SOAP
							keys_root_path:       [], # Caminho inicial da resposta / Chave pai principal
							body_xml_path:        [:consultar_lote_rps_response, :output_xml],
							xml_encode:           response_encoding, # Codificação do xml de resposta
							#//Envelope/Body/ConsultarLoteRpsResponse/ConsultarLoteRpsResult/ListaNfse/CompNfse/Nfse
							nfe_xml_path:         '//*/*/*/*/*/*/*',
							invoices_path:        [:consultar_lote_rps_resposta, :lista_nfse, :comp_nfse],
							message_errors_path:  [:consultar_lote_rps_resposta, :lista_mensagem_retorno_lote, :mensagem_retorno]
						).response
					end

					def response_class
						BrNfe::Service::Response::ConsultaLoteRps
					end
				end
			end
		end
	end
end
