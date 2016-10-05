# **Lighttpd Domain Adder**
*A short way to add a domain to your Lighttpd server.*


## **Pre Install**


We are assuming that you have been installed Lighttpd.
If you are not please lookup:
 https://www.google.com.tr/search?q=lighttpd+install

 ## **Install**


Download **lightdomainadd.sh** to your computer. You can use:
~~~bash
wget https://raw.githubusercontent.com/celilileri/lighttpd-domain-adder/master/lightdomainadd.sh
~~~

Then make it executable
~~~bash
chmod 4555 lightdomainadd.sh
~~~

Finally copy it to one of the **PATH** s'

Youc can use:
~~~bash
sudo cp lightdomainadd.sh /usr/bin/lightdomainadd
sudo cp lightdomainadd.sh /usr/bin/lightadddomain
~~~

***It is just that simple!***


## **Usage**

You can use as:

~~~bash
sudo lightadddomain
~~~

or

~~~bash
sudo lightdomainadd
~~~


press Enter, then enter your domain address.

**Or you may prefer:**

~~~bash
sudo lightadddomain domainname.com
~~~

or

~~~bash
sudo lightdomainadd domainname.com
~~~
