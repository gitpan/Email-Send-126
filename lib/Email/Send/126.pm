package Email::Send::126;

use 5.006;
use strict;
use warnings;
use MIME::Lite;
use MIME::Words qw(encode_mimewords);

our $VERSION = '0.04';


sub new {

    my $class = shift;
    my $user = shift;
    my $pass = shift;
    my $debug = shift;

    $debug = 0 unless defined $debug;

    eval {
        require MIME::Base64;
        require Authen::SASL;
    } or die "Need MIME::Base64 and Authen::SASL for sendmail";

    bless {user=>$user,pass=>$pass,debug=>$debug}, $class;
}

sub sendmail {

    my $self = shift;
    my $subhere = shift;
    my $content = shift;
    my @recepients = @_;

    my $to_address = join ',',@recepients;
    my $from_address = $self->{user} . '@126.com';

    my $subject = encode_mimewords($subhere,'Charset','UTF-8');
    my $data =<<EOF;
<body>
$content
</body>
EOF

    my $msg = MIME::Lite->new (
        From => $from_address,
        To => $to_address,
        Subject => $subject,
        Type     => 'text/html',
        Data     => $data,
        Encoding => 'base64',
    ) or die "create container failed: $!";

    $msg->attr('content-type.charset' => 'UTF-8');
    $msg->send( 'smtp',
                'smtp.126.com',
                 AuthUser=>$self->{user},
                 AuthPass=>$self->{pass},
                 Debug=>$self->{debug}
              );
}


1;

=head1 NAME

Email::Send::126 - Send email with 126.com's SMTP

=head1 VERSION

Version 0.04


=head1 SYNOPSIS

    use Email::Send::126;
    my $smtp = Email::Send::126->new("john","mypasswd");
    $smtp->sendmail($subject,$content,'foo@163.com','bar@sina.com');


=head1 METHODS

=head2 new($username, $password, [$debug])

Create the object.

The username and password are what you registered on 126.com, the largest email provider from China.

    my $smtp = Email::Send::126->new("username","password");
    # or with debug
    my $smtp = Email::Send::126->new("username","password",1);

=head2 sendmail($subject, $content, @recepients)

Send the message. 

The subject and content can be Chinese (if so they must be UTF-8 string).
They will be encoded with UTF-8 for sending.

The message content should be HTML syntax compatible, it will be sent as HTML format.

    my $subject = "Hello there";
    my $content = "<P>Hi there:</P><P>How are you?</P>";

    $smtp->sendmail($subject,$content,'foo@163.com');
    # or send to many people
    $smtp->sendmail($subject,$content,'foo@163.com','bar@sina.com','zhangsan@gmail.com');
    

=head1 AUTHOR

Ken Peng <yhpeng@cpan.org>


=head1 BUGS/LIMITATIONS

If you have found bugs, please send email to <yhpeng@cpan.org>


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Email::Send::126


=head1 COPYRIGHT & LICENSE

Copyright 2012 Ken Peng, all rights reserved.

This program is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself.

