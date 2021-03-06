require 'rails_helper'

describe MemeCaptainWeb::Config do
  let(:rb_path) do
    File.expand_path('../../../config/initializers/config.rb', __FILE__)
  end

  after(:all) do
    # Avoid polluting config module for later tests.
    rb_path = File.expand_path(
      '../../../config/initializers/config.rb', __FILE__
    )
    Kernel.silence_warnings { load(rb_path) }
  end

  context 'when the MC_SET_FRONT_PAGE_MIN_QUALITY env var is not set' do
    it 'uses the default' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::SetFrontPageMinQuality).to eq 0
    end
  end

  context 'when the MC_SET_FRONT_PAGE_MIN_QUALITY env var is set' do
    before do
      stub_const(
        'ENV',
        ENV.to_hash.merge('MC_SET_FRONT_PAGE_MIN_QUALITY' => '50')
      )
    end

    it 'uses the environment variable' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::SetFrontPageMinQuality).to eq(50)
    end
  end

  context 'when the GEND_IMAGE_HOST env var is not set' do
    it 'sets the config for it to nil' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::GEND_IMAGE_HOST).to be_nil
    end
  end

  context 'when the GEND_IMAGE_HOST env var is set' do
    before do
      stub_const(
        'ENV',
        ENV.to_hash.merge('GEND_IMAGE_HOST' => 'testhost.com')
      )
    end

    it 'uses the environment variable' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::GEND_IMAGE_HOST).to eq('testhost.com')
    end
  end

  context 'when the MAX_SRC_IMAGE_SIZE env var is not set' do
    it 'uses the default' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::MAX_SRC_IMAGE_SIZE).to eq 10_000_000
    end
  end

  context 'when the MAX_SRC_IMAGE_SIZE env var is set' do
    before do
      stub_const(
        'ENV',
        ENV.to_hash.merge('MAX_SRC_IMAGE_SIZE' => '78')
      )
    end

    it 'uses the environment variable' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::MAX_SRC_IMAGE_SIZE).to eq(78)
    end
  end

  context 'when the MAX_GIF_SHRINK_SIZE env var is not set' do
    it 'uses the default' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::MAX_GIF_SHRINK_SIZE).to eq(0)
    end
  end

  context 'when the MAX_GIF_SHRINK_SIZE env var is set' do
    before do
      stub_const(
        'ENV',
        ENV.to_hash.merge('MAX_GIF_SHRINK_SIZE' => '78')
      )
    end

    it 'uses the environment variable' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::MAX_GIF_SHRINK_SIZE).to eq(78)
    end
  end

  context 'when the IMAGE_BUCKET env var is not set' do
    it 'sets the config for it to nil' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::IMAGE_BUCKET).to be_nil
    end
  end

  context 'when the IMAGE_BUCKET env var is set' do
    before do
      stub_const(
        'ENV',
        ENV.to_hash.merge('IMAGE_BUCKET' => 'test-image-bucket')
      )
    end

    it 'uses the environment variable' do
      Kernel.silence_warnings { load(rb_path) }
      expect(MemeCaptainWeb::Config::IMAGE_BUCKET).to eq('test-image-bucket')
    end
  end
end
