package nextez.com.common.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import nextez.com.common.service.SettingMainService;

@Service("SettingMainService")
public class SettingMainServiceImpl implements SettingMainService{
 
    Logger log = (Logger) LogManager.getLogger(this.getClass());

    @Override
    public Map<String, Object> settingMainInfo(){
        Map<String, Object> resultMap = new HashMap<String, Object>();

        
        
        return resultMap;
    }
    
    
}
