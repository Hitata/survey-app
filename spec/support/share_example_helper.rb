module ShareExampleHelper
  shared_context :subject_get do
    let(:params) {}
    subject do
      get path, params: params, headers: headers
      response
    end
  end

  shared_context :subject_post do
    let(:params) {}
    subject do
      post path, params: params, headers: headers
      response
    end
  end

  shared_context :subject_delete do
    subject do
      delete path, headers: headers
      response
    end
  end
end
