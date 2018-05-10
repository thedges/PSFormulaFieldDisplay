({
    doInit : function(component, event, helper) {

      if (component.get("v.useChatterPhoto") == 'true')
      {
          helper.getChatterPhoto(component);
      }
        
      helper.executeQuery(component);
    }
})