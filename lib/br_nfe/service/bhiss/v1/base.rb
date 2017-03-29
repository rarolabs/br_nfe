module BrNfe
	module Service
		module Bhiss
			module V1
				class Base < BrNfe::Service::Base

					def wsdl
						# Belo Horizonte - MG
						if env == :production
							'https://bhissdigital.pbh.gov.br/bhiss-ws/nfse?wsdl'
						else
							'https://bhisshomologa.pbh.gov.br/bhiss-ws/nfse?wsdl'
						end
					end

					def ssl_request?
						true
					end

					# Assinatura através da gem signer
					def signature_type
						:method_sign
					end

					def soap_namespaces
						super.merge({
							'xmlns:ws' => "http://ws.bhiss.pbh.gov.br",
							'name' => 'nfse',
							'targetNamespace' => 'http://ws.bhiss.pbh.gov.br'
						})
					end


					def message_namespaces
						{"xmlns" => "http://www.abrasf.org.br/nfse.xsd"}
					end

					# Setado manualmente em content_xml
					#
					def namespace_identifier
					end

					# Método que deve ser sobrescrito em cada subclass.
					# É utilizado para saber qual a tag root de cada requisição
					#
					# <b><Tipo de retorno: /b> _String_
					#
					def soap_body_root_tag
						# 'recepcionarLoteRps' < Exemplo
						raise "Deve ser sobrescrito nas subclasses"
					end

					def response_encoding
						'ISO-8859-1'
					end

					def nfse_xml_path
						'//*' #Começa o XMl a partir do body e pega a tag ConsultarNfseResposta
					end

					# Método é sobrescrito para atender o padrão do órgão emissor.
					# Deve ser enviado o XML da requsiução dentro da tag CDATA
					# seguindo a estrutura requerida.
					#
					# <b><Tipo de retorno: /b> _String_ XML
					#
					def content_xml
						xml_signed = xml_builder.html_safe
						dados = "<ns2:#{soap_body_root_tag} xmlns:ns2='http://ws.bhiss.pbh.gov.br'>"
						dados += xml_signed
						dados += "</ns2:#{soap_body_root_tag}>"
						dados
					end

					# # Alíquota. Valor percentual.
					# #  Formato: 0.XXXX
					# #  Ex: 1% = 0.01
					# #  25,5% = 0.255
					# #  100% = 1.0
					# # Irá receber o valor decimal do percentual da aliquota
					# # e irá dividir por 100 conforme indicado na documentação.
					# #
					# def ts_aliquota value
					# 	value = value.to_f/100
					# 	value_monetary(value, 4)
					# end

				end
			end
		end
	end
end
