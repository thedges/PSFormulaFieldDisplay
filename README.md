# PSFormulaFieldDisplay

This package contains a Lightning Component (LC) to show the HTML rendering of a custom formula field. The formula field needs to be constructed to render HTML using various HTML tags as needed to get the display desired. It was created for demos to quickly add record details to a page and allow the demo engineer to control the layout/styling without having to create a new custom LC. And since this runs within a Lightning Component, you have access to CSS style classes defined in the [Lightning Design System](https://www.lightningdesignsystem.com/getting-started/) to use within your HTML markup. 

This component has 8 configuration parameters:
* <b>Show/Hide Header Section</b> - show or hide the header section
* <b>Card title</b> - the text for the title of the card to be displayed in header section
* <b>Card title color</b> - the text color for the title of the card to be displayed in header section
* <b>Header logo</b> - the icon to show on right-side of header section; this should be relative URL to a static resource file; default is logo at "/resource/SampleProfileLogo"; if you use custom logo icon, suggest to adjust height to about 90px 
* <b>Header background image</b> - the background image of the header section; this should be relative URL to a static resource file; default is people image at "/resource/SampleProfileBackground"; if you create your own, create image approx H: 81px and W:844px
* <b>Header background color</b> - the background color of the header section (this will override the background image)
* <b>Source of Data</b> - picklist of 3 options here: 1) Contact - access formula field on contact record of current logged in community user, 2) User - access formula field on user record of current logged in user, 3) Record - access formula field on current record that you are displaying
* <b>Field API Name</b> - the API name of the field to query on the contact, user, or record (as configured above)

For example, let's say you want to create a custom formula field on the User object called "Test Formula HTML". The formula field could be constructed with following:

```
'<h2 style="font-size: 1.25em">Some field data for: <span style="color: blue;">' +  FirstName + ' ' +  LastName  + '</span></h2><br/>' + 
'<table>'+ 
'<tr><td><b>Mobile:</b></td><td>' + MobilePhone + '</td></tr>' + 
'<td><b>Email:</b></td><td>' + Email + '</td></tr></tr>' +
'<td><b>Role Name:</b></td><td>' + UserRole.Name  + '</td>' +
'</table>'
```

Here is sample screenshot of formula field configuration:

![alt text](https://github.com/thedges/PSFormulaFieldDisplay/blob/master/PSFormulaFieldDisplay-1.png "Sample Image")

Next drag and drop the PSFormulaFieldDisplay component on your page and configure. For this sample, I dropped on a Case page but configured to pull data from the User record. Here is sample screen shot of configuration:

![alt text](https://github.com/thedges/PSFormulaFieldDisplay/blob/master/PSFormulaFieldDisplay-2.png "Sample Image")

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
