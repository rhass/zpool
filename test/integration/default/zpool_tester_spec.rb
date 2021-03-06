cmd = if os[:family] == 'solaris'
        '/usr/sbin/zpool'
      else
        'zpool'
      end

describe command("#{cmd} list") do
  its(:stdout) { is_expected.to match(/zpool1/) }
end

describe command("#{cmd} list") do
  its(:stdout) { is_expected.to match(/multiplevolumes/) }
end

describe command("#{cmd} status multiplevolumes") do
  its(:stdout) { is_expected.to match(/disk2/) }
  its(:stdout) { is_expected.to match(/disk3/) }
end

describe command("#{cmd} list") do
  its(:stdout) { is_expected.not_to match(/zpool2/) }
end

describe command("#{cmd} list") do
  its(:stdout) { is_expected.to match(/test/) }
end

describe command("#{cmd} status -v tank") do
  its(:stdout) { is_expected.to match(/raidz1/) }
end
