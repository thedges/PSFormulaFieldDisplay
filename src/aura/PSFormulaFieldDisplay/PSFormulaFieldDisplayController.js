({
    doInit : function(component, event, helper) {

      if (component.get("v.photoSource") != '')
      {
          helper.getPhoto(component);
      }
        
      helper.executeQuery(component);
    }
})