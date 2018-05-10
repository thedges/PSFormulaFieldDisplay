({
	executeQuery : function(component) {
		       //////////////////////
        // setup apex query //
        //////////////////////
        var action = component.get("c.queryData");
        
        var paramMap = {};
        paramMap['recId'] = component.get("v.recordId");
        paramMap['sourceType'] = component.get("v.sourceType");
        paramMap['fieldAPIName'] = component.get("v.fieldAPIName");
        paramMap['useChatterPhoto'] = component.get("v.useChatterPhoto");
        
        action.setParams({
            "params": JSON.stringify(paramMap)
        });
        
        /////////////////////
        // handle callback //
        /////////////////////
        action.setCallback(component, function(response) {
            var globalId = component.getGlobalId();
            var resp = JSON.parse(response.getReturnValue());
            if (resp.status === 'ERROR') {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Warning!",
                    "message": resp.msg,
                    //"duration": 2000,
                    "type": "warning",
                    mode: "sticky"
                });
                toastEvent.fire();
            }
            else
            {
                document.getElementById(globalId + '_fieldHTML').innerHTML = resp.data;
            }
        });
        
        $A.enqueueAction(action);
	},
    getChatterPhoto : function(component) {
		       //////////////////////
        // setup apex query //
        //////////////////////
        var action = component.get("c.queryChatterPhoto");
        
        /////////////////////
        // handle callback //
        /////////////////////
        action.setCallback(component, function(response) {
            var resp = JSON.parse(response.getReturnValue());
            if (resp.status === 'ERROR') {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Warning!",
                    "message": resp.msg,
                    //"duration": 2000,
                    "type": "warning",
                    mode: "sticky"
                });
                toastEvent.fire();
            }
            else
            {
                if (resp.data != null && resp.data != '')
                {
                  component.set("v.chatterPhotoURL", resp.data);
                }
                else
                {
                  component.set("v.chatterPhotoURL", component.get("v.headerLogoIcon"));
                }
            }
        });
        
        $A.enqueueAction(action);
	}
})