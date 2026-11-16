package playerio
{
   public interface PartnerPay
   {
      
      function trigger(param1:String, param2:uint, param3:Function = null, param4:Function = null) : void;
      
      function get currentPartner() : String;
      
      function setTag(param1:String, param2:Function = null, param3:Function = null) : void;
   }
}

