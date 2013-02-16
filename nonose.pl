use Purple;
%PLUGIN_INFO = (
    perl_api_version => 2,
    name => "NoNose Emoticons",
    version => "0.1",
    summary => "Remove noses from incoming emoticons",
    description => "Remove noses from incoming emoticons",
    author => "Will Fuqua",
    url => "http://fuqua.io",
    load => "plugin_load",
    unload => "plugin_unload"
);
sub plugin_init {
    return %PLUGIN_INFO;
}
sub plugin_load {
    my $plugin = shift;
    Purple::Debug::info("nonoseplugin", "plugin_load() - Plugin Loaded.\n");
    $conv = Purple::Conversations::get_handle();
    Purple::Signal::connect($conv, "receiving-im-msg", $plugin, \&receiving_im_msg_cb, "");
}
sub plugin_unload {
    my $plugin = shift;
    Purple::Debug::info("nonoseplugin", "plugin_unload() - Plugin Unloaded.\n");
}
sub receiving_im_msg_cb {
    my ($account, $who, $msg, $conv, $flags) = @_;
    $msg =~ s/:-/:/g; # initiate advanced smiley nose detection system
    $_[2] = $msg
}
