ConfigHistory
=============

Keep track all configuration files on git, with a centralized configuration.

Basically you setup the configuration_file(config_history.yaml) and this daemon will run periodically getting any
changes and keeping them safe on a git repository, allowing you to restore them in the future if necessary and
also compare what was changed

Install
-------

You will need:
* ruby 1.9+
* git
* rubygems (or rvm)

The install process is simple:

1.  Choose the directory where you want to install

2.  Clone this project:
<pre>
git clone git@github.com:PedroSena/ConfigHistory.git
</pre>

3.  Install the daemons gem:
<pre>
gem install daemons
</pre>

4.  Change config_history.yaml as you want. You can have as many sections as you nned (just make sure to put them under 'sections')

5.  Create a start-up script(this process changes according to your OS) that runs this command:
<pre>
ruby INSTALL_DIR/ConfigHistory/config_history.rb start
</pre>

Where INSTALL_DIR is the directory you choose previously.

Don't call this daemon from cron, the daemon will run periodically according to the number of
minutes you setup on config_history.yaml (time_frame variable)

License
-------

ConfigHistory is released under the [MIT License](http://www.opensource.org/licenses/MIT).