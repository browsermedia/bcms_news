#This branch is specifically for Projects that were upgraded to BCMS 4.0 that previously had bcms_news.
#This may not work on a new implementation of BCMS 4.0 that did not previously have bcms_news installed
#Current state:  This will allow the news to function correctly in the front end of the cms, however there is an error thrown
#when logged into the cms.  The error seems to point to browsercms / app / views / layouts / cms / _content_types.html.erb
#Indications are it may be a namespacing issue in the main browsercms project.



# News Module for BrowserCMS

A module to create and display News Items or Press Releases content.

## Features

* *News Articles* - Contributors can create News Articles with attributes like release date, title, summary, body and an attachment.
* *Friendly URLs* - Each news article will have its own unique path created automatically based on its name. Published article can be accessed via these paths.
* *RSS - Visitors* can subscribe to an RSS feed that displays the most recent 15 News Articles.
* *Recent News* - Contributors can show the most recent few articles (via a Portlet) on any page. The exact # of articles shown can be configured.
* *Archive* - Visitors can browse all past articles. By default, the portlet will display articles in reverse chronological order, grouped by month.
* *Categorized* - Uses the core Category module to allow each News Article to marked for a particular Category. Both the _Recent News_ and _Archive_ can be configured to show articles only in a particular category.
* *Configurable Views* - Each portlet's view can be edited via the CMS UI to be tweaked for any site design.
* *News Section* - A top level 'News' section will be created along with several pages designed to handle the above features will be created.

## News Articles
The News Module defines a new content type, "News Article" which comes with the following fields.

* Name (Textfield)
* Release Date (Date Picker)
* Category (Select one)
* Summary (Textarea) - Appears in summarized lists (like 'Recent News')
* Body (HTML Editor) - Appears when individual news articles are viewed.
* File (File Upload) - Allows files attachments like PDF attachments to be added
* Tags (Free Form Tagging) - Allows multiple free form tags to be applied to any article.

## Installation

### 1. Install Module

As per the [standard module installation guide](http://guides.browsercms.org/installing_modules.html), you can install this module using the following steps:

```
$ rails g cms:install bcms_news
$ bundle install
$ rake db:migrate
$ rake db:seed:bcms_news
```
Note: The last step is required if you have ever run `rake db:seed` on your local database, as you need to add the news specific seed data to your project. On a brand new project, `rake db:seed` would also install this content.

### 2. Configure RSS Feeds

To have autodiscovery links to the News RSS feed, add the following to your page templates in the `head` element.

```
<%= auto_discovery_link_tag( :rss, bcms_news.news_feed_url, {:title => "RSS Feed for News Articles"}) %>
```

### 3. Publish Pages

The news module will create several pages under a 'News' section in the root of the Sitemap. You will need to publish these pages via the sitemap in order for them to display in the menus.

You will also likely want to mark the 'Article' page as hidden from menus.
