# Server: SSH and SCP

## Jak na zapezpečení serveru

+ Používejte whitelist nikoliv blacklist
  Tedy zakažte v základu vše a povolte jen to co chcete, nikoliv opačně.
+ run tpcdump
+ Všechny veřejně dostupné služby udržuj aktuální a aplikuj na ně patche.

Securing OpenSSH

> /etc/ssh/sshd_config

Používej silná hesla a občas je změň.

Zakaž přihlašování pod účtem root.
> PermitRootLogin no

Pokud potřebuješ root oprávnění, přihlaš se jako normální uživatel a použij `su`.

Povol přihlašování pouze známým uživatelům
> AlowUsers alice barbora cyril

Použijeme výše zmíněnou direktivu namísto
> DenyUsers ....
protože ctíme whitelist rule.

Zakaž použití protokolu 1
> Protocol 2

Použij nestandardní port (ověř jestli to není zbytečné)
> Port 53053


Používej klíče pro přihlašování nikoliv heslo.
> viz dále

Zamez přihlašování heslem
> PasswordAuthentication no

Zavři uživatele v jejich domovském adresáři
[http://www.techrepublic.com/blog/linux-and-open-source/chroot-users-with-openssh-an-easier-way-to-confine-users-to-their-home-directories/](http://www.techrepublic.com/blog/linux-and-open-source/chroot-users-with-openssh-an-easier-way-to-confine-users-to-their-home-directories/)

Doplnit

Kopírování klíče
> cat id_rsa.pub >> ~/.ssh/authorized_keys	


---

## Odkazy

[https://help.ubuntu.com/community/SSH](https://help.ubuntu.com/community/SSH)
[http://www.root.cz/clanky/dnssec-jako-bezpecne-uloziste-ssh-klicu/](http://www.root.cz/clanky/dnssec-jako-bezpecne-uloziste-ssh-klicu/)


## Úvod

Abysme mohli pracovat s SSH musíte ovládat příkazovou řádku, zejména editaci konfiguračních souborů, spouštění  a zastavování procesů (daemon).


Protokol SSH (*Secure Shell*); implementace OpenSSH
Protokol SCP (*Secure Copy*)

## Instalace

	openssh-client
	openssh-server

	ssh-copy-id
	ssh-add
	ssh-agent
	ssh-keysign
	ssh-keyscan
	ssh-keygen
	sftp-server

## Nastavení OpenSSH serveru

Základní nastavení OpenSSH serveru je zapsáno v konfiguračním souboru, který je umístěn v souboru `/etc/ssh/ssh_config`. Nejdříve ze všeho doporučuji udělat si kopii původního konfiguračního souboru  a zamezit jeho přepsání. To nám umožní kdykoliv obnovit výchozí nastavení.

	sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
	sudo chmod a-w /etc/ssh/sshd_config.original

### Nastavení portu

V základním nastavení je OpenSSH server přístupný na portu 22. Tento port je všem všeobecně známý, takže pokud chceme zamezit tomu, aby se  po úspěšném útoku stal tento port branou do naši "pevnosti", bude lepší ho zaměnit za jiný. Tím případným útočníkům trochu znesnadníme práci. Z nabízených portů bychom měli vybrat takový, který není běžně používán jinou aplikací. Takové volné (dynamické) porty mají číslo v intervalu 49152&ndash;62535.


**Poznámka**<br> Porty 0-1023 (registrované) jsou běžně využívané jinými aplikacemi. U portů 1024-49151 není vyloučeno, že mohou být také použity, proto ani ty raději nepoužíváme.


Vyberem namátkou třeba port 53053, ale nejdříve si otestujeme jestli je opravdu volný:

	netstat -ltnup | grep ":53033"

Pokud je výstup prázdný, můžeme ho použít. Pustíme se tedy do editace konfiguračního souboru.

	sudo vim /etc/ssh/sshd_config

Odkomentujeme řádek s konfigurační direktivou `Port 22` a změníme číslo portu.

	Port 53053

### Omezení přihlašování


## Přihlašování pomocí klíče


### Úvod

Autentizace ověřuje totožnost uživatele. Jak se autentizovat? Jak počítač zjistí moji totožnost?
Heslo?

Nevýhody:

Někdo ho může uhodnout, protože jsem si ho někam napsal, protože jsem se bál,
že ho zapomenu nebo je tak složité, že si ho ani pamatovat nemohu.Je možné jej odposlechnout atd., protože je posíláno nezabezpečenou cestou nebo server na který je posíláno je kompromitován.


Řešení:
Přihlašování pomocí SSH a veřejného klíče.

Princip:
Na počítači, ze kterého se budeme přihlašovat si pod naším účtem necháme vygenerovat jeden soukromý a jeden veřejný klíč. Veřejné klíče nakopírujeme na všechna místo (server), kam se chceme přihlašovat. Soukromý klíč si ponecháme uschovaný.

Co když se někdo dostane k našemu soukromému klíči?
Pokud by se někdo dostal k ...


Pro přihlašování za pomoci klíčů, potřebujem klíče dva. Jeden veřejný &hellip; 
ten můžeme zveřejnit či poslat komukoliv a souhromý, ke kterému máme přístup 
pouze my. Oba klíče jsou vytvořeny současně a tvoří neoddělitelný pár 
(*public private key pair*). Co je zašifrováno jedním klíčem, může být 
dešifrováno jen druhým v páru a naopak.

> jskjaksjakj


### Vytvoření veřejného a soukromého klíče

Vytvoří ve složce `.ssh` dva soubory &mdash; veřejný klíč `id_rsa.pub` a soukromý klíč `id_rsa`.

	ssh-keygen -t rsa -b 2048

Pokud chceme klíč pojmenovat jinak použijem přepínač `-f [filename]`		

Cestu ponecháme jako je nám nabízena:

	Generating public/private rsa key pair.
	Enter file in which to save the key (/home/uetoyo/.ssh/id_rsa):

Zadáme dostatečně silné heslo.

	Enter passphrase (empty for no passphrase):
	Enter same passphrase again:

	Your identification has been saved in /home/uetoyo/.ssh/id_rsa.
	Your public key has been saved in /home/uetoyo/.ssh/id_rsa.pub.

	The key fingerprint is:
	bc:0d:f8:fb:d3:5a:35:6b:91:33:aa:bd:56:a4:35:a3 uetoyo@mercury2

	The key's randomart image is:
	+--[ RSA 2048]----+
	|                 |
	|                 |
	|                 |
	|       o      =. |
	|      . S    =Bo |
	|       . +  Eo.* |
	|        o ..o.o  |
	|         ..+o.   |
	|        ..++o.   |
	+-----------------+

Co je to fingerprint a randomart image?


Nyní mámem dva soubory, které spolu těsně souvisí &mdash; soubory tvoří pár klíčů (*public&ndash;private key pair*).

	id_rsa <--> id_rsa.pub

Co je šifrováno jedním klíčem, může být dešifrováno jen druhým klíčem v páru.

Nastavíme správná přístupová práva.

	chmod 700 ~/.ssh && chmod 600 ~/.ssh/*


JAK NA SERVER

Po instalaci Debianu prvni se prihlasime jako root -- poprve  a naposled.


	adduser uetoyo

Přidáme uživatele do skupiny `sudo` v etc/sudoers

	adduser uetoyo sudo

Přihlásíme se znovu pod novým účtem a usjitíme se, že máme práva pro su.

	root@debian: su toor
	toor@debian: su
	toor@debian: whoami

Edit /etc/ssh/sshd_config with your favorite text editor.

	vi /etc/ssh/sshd_config

	#PermitRootLogin yes
	--->

## Nastavení SSH přístupu pro administrátora.

### 1 Přihlásíme se jako uživatel s administrátorskými právy (admin user nikoliv root).

 	ssh user@machine

### 2 Vygenerujeme si veřejný a soukromý klíč.

 	ssh-keygen -t rsa -b 2048

### 3 Nastavíme práva pro složku a soubory.

 	chmod 700 ~/.ssh


### 4 Pod uživatelovým profilem si vytvoříme složku .ssh a nastavíme práva.

	mkdir ~/.ssh


SSH Secure Shell

	ssh user@machine

### Autentizace pomocí hesla

### Autentizace pomocí klíče


### Přihlašování na vzdálený stroj bez hesla

### Generování klíče

	ssh-keygen -t rsa -b 4096

Budou vygenerovány dva klíče -- veřejný a soukromý

Veřejný klíč umístíme do ~/.ssh/authorized_keys/
Nyní se můžeme přihlásit bez hesla.

Na zkopírování se dá použít utilita ssh-copy-id

ssh -X spustí grafické rozhraní


# SCP Secure Copy

Jak zkopírovat klíč ze serveru S1 na server S2?

ssh-copy-id [-i [identity_file]] [user@]machine


## Spojení mezi systémy

### Linux&mdash;Linux


### Windows&mdash;Linux


# První přihlášení k serveru

přihlásíme se jako root

> ssh root@xxx.xxx.xx.xx

= utok man-in-the-middle (MIM)

