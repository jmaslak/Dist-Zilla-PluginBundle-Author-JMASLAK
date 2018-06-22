#!/usr/bin/perl

#
# Copyright (C) 2018 Joelle Maslak
# All Rights Reserved - See License
#

package Dist::Zilla::PluginBundle::Author::JMASLAK;
# ABSTRACT: JMASLAK's Plugin Bundle

use v5.10;

=head1 USAGE

In your C<dist.ini> -

    [@Filter]
    -bundle  = @Author::JMASLAK
    -version = 0.002

The C<-version> option should specify the latest version required and tested
with a given package.

=head1 DESCRIPTION

This is Joelle Maslak's plugin bundle, used for her modules.  If you're not
her, you probably want to create your own plugin module because I may modify
this module based on her needs, breaking third party modules that use this.

All of the following are in this module as of v0.002.

It is somewhat equivilent to:

    [AutoPrereqs]
    [ConfirmRelease]
    [ContributorCovenant]

    [CopyFilesFromBuild]
    copy = 'CODE_OF_CONDUCT.md'
    copy = 'README.pod'

    [Covenant]
    [ExecDir]
    [ExtraTests]
    [GatherDir]
    [Git::Check]
    [Git::Commit]
    [Git::Push]
    [Git::Tag]
    [GitHub::Meta]
    [License]
    [Manifest]
    [ManifestSkip]
    [Makemaker]
    [MetaJSON]
    [MetaProvides::Package]
    [MetaYAML]
    [PkgVersion]
    [PodSyntaxTests]
    [PodWeaver]
    [PruneCruft]
    [ShareDir]

    [ReadmeAnyFromPod]
    type     = pod
    filename = README.pod

    [Test::EOL]
    [Test::Kwalitee::Extra]
    [Test::NoTabs]
    [Test::ReportPrereqs]

    [Test::TrailingSpace]
    filename_regex = '\.($?:ini|pl|pm|t|txt)\z'

    [Test::UnusedVars]
    [Test::UseAllModules]
    [Test::Version]
    [TestRelease]
    [UploadToCPAN]

=head1 SEE ALSO

Core Dist::Zilla plugins:

Dist::Zilla roles:
L<PluginBundle|Dist::Zilla::Role::PluginBundle>,
L<PluginBundle::Easy|Dist::Zilla::Role::PluginBundle::Easy>.

=cut

use Moose;
use Dist::Zilla;

with 'Dist::Zilla::Role::PluginBundle::Easy';

# For auto plugins
AUTOPLUG {
    use Dist::Zilla::Plugin::AutoPrereqs;
    use Dist::Zilla::Plugin::Covenant;
    use Dist::Zilla::Plugin::ContributorCovenant;
    use Dist::Zilla::Plugin::ExecDir;
    use Dist::Zilla::Plugin::ExtraTests;
    use Dist::Zilla::Plugin::GatherDir;
    use Dist::Zilla::Plugin::Git::Check;
    use Dist::Zilla::Plugin::Git::Commit;
    use Dist::Zilla::Plugin::Git::Push;
    use Dist::Zilla::Plugin::Git::Tag;
    use Dist::Zilla::Plugin::GitHub::Meta;
    use Dist::Zilla::Plugin::License;
    use Dist::Zilla::Plugin::ManifestSkip;
    use Dist::Zilla::Plugin::MetaJSON;
    use Dist::Zilla::Plugin::MetaProvides::Package;
    use Dist::Zilla::Plugin::MetaYAML;
    use Dist::Zilla::Plugin::PkgVersion;
    use Dist::Zilla::Plugin::PodSyntaxTests;
    use Dist::Zilla::Plugin::PodWeaver;
    use Dist::Zilla::Plugin::PruneCruft;
    use Dist::Zilla::Plugin::ShareDir;
    use Dist::Zilla::Plugin::ReadmeAnyFromPod;
    use Dist::Zilla::Plugin::Test::EOL;
    use Dist::Zilla::Plugin::Test::Kwalitee::Extra;
    use Dist::Zilla::Plugin::Test::NoTabs;
    use Dist::Zilla::Plugin::Test::ReportPrereqs;
    use Dist::Zilla::Plugin::Test::UnusedVars;
    use Dist::Zilla::Plugin::Test::UseAllModules;
    use Dist::Zilla::Plugin::Test::Version;

    use Dist::Zilla::Plugin::MakeMaker;
    use Dist::Zilla::Plugin::Manifest;

    use Dist::Zilla::Plugin::CopyFilesFromBuild;
    use Dist::Zilla::Plugin::ConfirmRelease;
    use Dist::Zilla::Plugin::TestRelease;
    use Dist::Zilla::Plugin::UploadToCPAN;
}

sub configure {
    my ($self) = (@_);

    #
    # Basically @Basic - without Readme
    #
    $self->add_plugins('AutoPrereqs');
    $self->add_plugins('Covenant');
    $self->add_plugins('ContributorCovenant');
    $self->add_plugins('ExecDir');
    $self->add_plugins('ExtraTests');
    $self->add_plugins('GatherDir');
    $self->add_plugins('Git::Check');
    $self->add_plugins('Git::Commit');
    $self->add_plugins('Git::Push');
    $self->add_plugins('Git::Tag');
    $self->add_plugins('GitHub::Meta');
    $self->add_plugins('License');
    $self->add_plugins('ManifestSkip');
    $self->add_plugins('MetaJSON');
    $self->add_plugins('MetaProvides::Package');
    $self->add_plugins('MetaYAML');
    $self->add_plugins('PkgVersion');
    $self->add_plugins('PodSyntaxTests');
    $self->add_plugins('PodWeaver');
    $self->add_plugins('PruneCruft');
    $self->add_plugins('ShareDir');
    $self->add_plugins( [ 'ReadmeAnyFromPod' => { type => 'pod', filename => 'README.pod' } ] );
    $self->add_plugins('Test::EOL');
    $self->add_plugins('Test::Kwalitee::Extra');
    $self->add_plugins('Test::NoTabs');
    $self->add_plugins('Test::reportPrereqs');
    $self->add_plugins(
        [ 'Test::TrailingSpace' => { filename_regex => '\.($?:ini|pl|pm|t|txt)\z' } ] );
    $self->add_plugins('Test::UnusedVars');
    $self->add_plugins('Test::UseAllModules');
    $self->add_plugins('Test::Version');

    $self->add_plugins('MakeMaker');
    $self->add_plugins('Manifest');

    $self->add_plugins(
        [
            'CopyFilesFromBuild' =>
              { copy => [ 'CODE_OF_CONDUCT.md', 'README.pod' ] }
        ]
    );
    $self->add_plugins('ConfirmRelease');
    $self->add_plugins('TestRelease');
    $self->add_plugins('UploadToCPAN');

    return;
}

__PACKAGE__->meta->make_immutable;

1;

