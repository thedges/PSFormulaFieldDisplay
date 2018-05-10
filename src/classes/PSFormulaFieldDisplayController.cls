public class PSFormulaFieldDisplayController {
    @AuraEnabled
    public static String queryData(String params)
    {
        System.debug('params=' + params);
        Map<String, String> paramMap = (Map<String, String>)JSON.deserialize(params,   Map<String, String>.class);
        PSResponse resp = new PSResponse();
        
        try
        {
            String recId = null;
            String sourceType = paramMap.get('sourceType');
            String fieldAPIName = paramMap.get('fieldAPIName');
            String objectName = null;
            
            resp.data = '';
            
            if (sourceType == 'Contact')
            {
                // String userType = UserInfo.getUserType(); // https://developer.salesforce.com/forums/?id=906F000000094P2IAI
                String userId = UserInfo.getUserId();
                User u = [SELECT Id, ContactId, MediumPhotoUrl FROM User WHERE Id = :userId LIMIT 1];
                recId = u.ContactId;
            }
            else if (sourceType == 'User')
            {
                recId = UserInfo.getUserId();
            }
            else if (sourceType == 'Record')
            {
                recId = paramMap.get('recId');
            }
            
            if (recId != null)
            {
                Id rId = Id.valueOf(recId);
                Schema.SObjectType token = rId.getSObjectType();
                Schema.DescribeSObjectResult dr = token.getDescribe();
                objectName = dr.getName();
                
                if (objectName != null)
                {
                    String queryStr = 'SELECT Id, ' + fieldAPIName + ' FROM ' + dr.getName() + ' WHERE Id=\'' + recId + '\' LIMIT 1';
                    
                    SObject obj = Database.query(queryStr);
                    System.debug('obj=' + JSON.serializePretty(obj));
                    
                    resp.data = obj.get(fieldAPIName);
                }
            }
        }
        catch (exception e)
        {
            resp.status = PSResponse.ERROR;
            resp.msg = e.getMessage();
        }
        
        return  JSON.serialize(resp);
        
    }
    
    @AuraEnabled
    public static String queryPhoto(String params)
    {
        System.debug('params=' + params);
        Map<String, String> paramMap = (Map<String, String>)JSON.deserialize(params,   Map<String, String>.class);
        PSResponse resp = new PSResponse();
        
        try
        {
            String recId = paramMap.get('recId');
            String photoSource = paramMap.get('photoSource');
            String photoFieldAPIName = paramMap.get('photoFieldAPIName');
            
            resp.data = '';
            
            if (photoSource == 'Record')
            {
                if (recId != null)
                {
                    Id rId = Id.valueOf(recId);
                    Schema.SObjectType token = rId.getSObjectType();
                    Schema.DescribeSObjectResult dr = token.getDescribe();
                    String objectName = dr.getName();
                    
                    if (objectName != null)
                    {
                        String queryStr = 'SELECT Id, ' + photoFieldAPIName + ' FROM ' + dr.getName() + ' WHERE Id=\'' + recId + '\' LIMIT 1';
                        
                        SObject obj = Database.query(queryStr);               
                        resp.data = obj.get(photoFieldAPIName);
                    }
                }
            }
            else if (photoSource == 'Chatter')
            {
                String userId = UserInfo.getUserId();
                User u = [SELECT Id, MediumPhotoUrl FROM User WHERE Id = :userId LIMIT 1];
                resp.data = u.MediumPhotoUrl;
            }
            
        }
        catch (exception e)
        {
            resp.status = PSResponse.ERROR;
            resp.msg = e.getMessage();
        }
        
        return  JSON.serialize(resp);
        
    }
}