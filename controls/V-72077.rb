# encoding: utf-8
#
=begin
-----------------
Benchmark: Red Hat Enterprise Linux 7 Security Technical Implementation Guide
Status: Accepted

This Security Technical Implementation Guide is published as a tool to improve
the security of Department of Defense (DoD) information systems. The
requirements are derived from the National Institute of Standards and
Technology (NIST) 800-53 and related documents. Comments or proposed revisions
to this document should be sent via email to the following address:
disa.stig_spt@mail.mil.

Release Date: 2017-03-08
Version: 1
Publisher: DISA
Source: STIG.DOD.MIL
uri: http://iase.disa.mil
-----------------
=end

control "V-72077" do
  title "The telnet-server package must not be installed."
  desc  "
    It is detrimental for operating systems to provide, or install by default,
functionality exceeding requirements or mission objectives. These unnecessary
capabilities or services are often overlooked and therefore may remain unsecured.
They increase the risk to the platform by providing additional attack vectors.

    Operating systems are capable of providing a wide variety of functions and
services. Some of the functions and services, provided by default, may not be
necessary to support essential organizational operations (e.g., key missions,
functions).

    Examples of non-essential capabilities include, but are not limited to, games,
software packages, tools, and demonstration software not related to requirements or
providing a wide array of functionality not required for every mission, but which
cannot be disabled.
  "
  impact 0.7
  tag "severity": "high"
  tag "gtitle": "SRG-OS-000095-GPOS-00049"
  tag "gid": "V-72077"
  tag "rid": "SV-86701r1_rule"
  tag "stig_id": "RHEL-07-021710"
  tag "cci": "CCI-000381"
  tag "nist": ["CM-7 a", "Rev_4"]
  tag "check": "Verify the operating system is configured to disable non-essential
capabilities. The most secure way of ensuring a non-essential capability is disabled
is to not have the capability installed.

The telnet service provides an unencrypted remote access service that does not
provide for the confidentiality and integrity of user passwords or the remote
session.

If a privileged user were to log on using this service, the privileged user password
could be compromised.

Check to see if the telnet-server package is installed with the following command:

# yum list installed | grep telnet-server

If the telnet-server package is installed, this is a finding."
  tag "fix": "Configure the operating system to disable non-essential capabilities
by removing the telnet-server package from the system with the following command:

# yum remove telnet-server"

  describe package('telnet-server') do
    it { should_not be_installed }
  end
end
