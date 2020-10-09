#!/usr/bin/perl

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;



print color 'reset';
print q{
           Запуск приложения...           0.5 alfa ✓          1.0 beta           3.0 Релиз

};

print color 'red';
 
print q{

    ██████╗ ██╗ ██████╗   ██████╗ ██████╗  █████╗      ██╗██████╗
    ██╔══██╗██║██╔════╝   ██╔══██╗██╔══██╗██╔══██╗     ██║██╔══██╗
    ██████╦╝██║██║  ██╗   ██████╦╝██████╔╝██║  ██║     ██║██████╔╝
    ██╔══██╗██║██║  ╚██╗  ██╔══██╗██╔══██╗██║  ██║     ██║██╔═══╝
    ██████╦╝██║╚██████╔╝  ██████╦╝██║  ██║╚█████╔╝██╗  ██║██║
    ╚═════╝ ╚═╝ ╚═════╝   ╚═════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝╚═╝

};
print color 'reset';

print q{ IP Геолокация  
                By: Bafomet https://t.me/satana666mx
                Инструмент №002
------------------------------------
};
 
print color 'yellow';
@iphost=$ARGV[0] || die "Использовать : ./satana_locator_0.5.pl [хост] [ip] [домен] \n\nПример:  ./satana_locator_0.5.pl       google.com \n         ./satana_locator_0.5.pl       216.58.209.150\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
#{
#    "Статус": "Успешно",
#    "Страна": "Страна",
#    "countryCode": "COUNTRY CODE",
#    "Регион": "REGION CODE",
#    "regionName": "REGION NAME",
#    "Город": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "Временная зона": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] Организация: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Страна: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] Город: ", $info->{'city'}, "\n";
print "  [+] Регион: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "------------------------------------\n"; 
print "  [+] Geo: ", "Долгота: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Geo: ", "Широта: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "------------------------------------\n"; 
print "  [+]", " Временная зона: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [+] As номер/имя: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Код страны: ", $info->{'countryCode'}, "\n"; 
print "  [+] Статус: ", $info->{'status'}, "\n"; 
print "\n";
# EOF
