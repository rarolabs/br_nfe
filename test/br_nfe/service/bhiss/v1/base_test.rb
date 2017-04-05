require 'test_helper'

describe BrNfe::Service::Bhiss::V1::Base do
	# subject             { FactoryGirl.build(:service_bhiss_v1_base, emitente: emitente) }
	# let(:rps)           { FactoryGirl.build(:br_nfe_rps, :completo) }
	# let(:emitente)      { FactoryGirl.build(:service_emitente) }
	# let(:intermediario) { FactoryGirl.build(:intermediario) }

	# describe "inheritance class" do
	# 	it { subject.class.superclass.must_equal BrNfe::Service::Base }
	# end
	#
	# describe "#canonicalization_method_algorithm" do
	# 	it { subject.canonicalization_method_algorithm.must_equal 'http://www.w3.org/2001/10/xml-exc-c14n#' }
	# end
	#
	# describe "#message_namespaces" do
	# 	it "deve ter um valor" do
	# 		subject.message_namespaces.must_equal({"xmlns" => "http://www.abrasf.org.br/nfse.xsd"})
	# 	end
	# end

	# describe "#signature_type" do
	# 	it "deve realizar as assinaturas pela gem signer" do
	# 		subject.signature_type.must_equal :method_sign
	# 	end
	# end
	#
	# describe "#soap_namespaces" do
	# 	it "deve conter os namespaces padrões mais o namespace da mensagem" do
	# 		subject.soap_namespaces.must_equal({
	# 			'xmlns:soapenv'   => 'http://schemas.xmlsoap.org/soap/envelope/',
	# 			'xmlns:ins0'      => 'http://www.w3.org/2000/09/xmldsig#',
	# 			'xmlns:xsd'       => 'http://www.w3.org/2001/XMLSchema',
	# 			'xmlns:xsi'       => 'http://www.w3.org/2001/XMLSchema-instance',
	# 			'xmlns:ws'        => "http://ws.bhiss.pbh.gov.br",
	# 			'name'            => 'nfse',
	# 			'targetNamespace' => 'http://ws.bhiss.pbh.gov.br'
	# 		})
	# 	end
	# end
	#
	# describe "#namespaces" do
	# 	it '-> namespace_identifier'    do subject.namespace_identifier.must_be_nil    end
	# 	it '-> namespace_for_tags'      do subject.namespace_for_tags.must_be_nil      end
	# 	it '-> namespace_for_signature' do subject.namespace_for_signature.must_be_nil end
	# end
	#
	# describe "#soap_body_root_tag" do
	# 	it "por padrão deve dar um Raise pois é necessário que seja sobrescrito nas sublcasses" do
	# 		assert_raises RuntimeError do
	# 			subject.soap_body_root_tag
	# 		end
	# 	end
	# end
	#
	# describe "#content_xml" do
	# 	let(:expected_xml) do
	# 		dados = "<ns2:rootTag xmlns:ns2='http://ws.bhiss.pbh.gov.br'>"
	# 		dados += '<?xml version="1.0" encoding="ISO-8859-1"?>'
	# 		dados += '<xml>Builder</xml>'
	# 		dados += "</ns2:rootTag>"
	# 		dados
	# 	end
	#
	# 	it "deve encapsular o XML de xml_builder em um XML body no padrão da Bhiss" do
	# 		subject.expects(:soap_body_root_tag).returns('rootTag').twice
	# 		subject.expects(:xml_builder).returns('<xml>Builder</xml>')
	# 		subject.content_xml.must_equal expected_xml
	# 	end
	#
	# 	it "Caso o xml_builder já vier com a tag <?xml não deve inserir a tag novamnete" do
	# 		subject.expects(:soap_body_root_tag).returns('rootTag').twice
	# 		subject.expects(:xml_builder).returns('<?xml version="1.0" encoding="ISO-8859-1"?><xml>Builder</xml>')
	# 		subject.content_xml.must_equal expected_xml
	# 	end
	# end
	#
	# # describe '#ts_aliquota' do
	# # 	it "sempre deve pegar o valor do parâmetro e dividir por 100" do
	# # 		subject.ts_aliquota(35.75).must_equal 0.3575
	# # 	end
	# # end

end
