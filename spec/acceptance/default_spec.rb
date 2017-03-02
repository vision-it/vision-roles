require 'spec_helper_acceptance'

describe 'vision_roles' do
  context 'with defaults' do
    it 'run idempotently' do
      pp = <<-EOS
        class { 'vision_roles': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'packages installed' do
    describe package('wget') do
      it { is_expected.to be_installed }
    end
  end
end
