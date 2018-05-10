# PSFormulaFieldDisplay

This package contains a component to show the HTML rendering of a custom formula field. The formula field needs to be constructed to render HTML using various tags as needed to get the display desired. 

This component has 2 configuration parameters:
* <b>Source of Data</b> - picklist of 3 options here: 1) Contact - access formula field on contact record of current logged in community user, 2) User - access formula field on user record of current logged in user, 3) Record - access formula field on current record that you are displaying
* <b>Field API Name</b> - the API name of the field to query on the contact, user, or record (as configured above)

![alt text](https://github.com/thedges/PSFormulaFieldDisplay/blob/master/PSFormulaFieldDisplay.png "Sample Image")

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
