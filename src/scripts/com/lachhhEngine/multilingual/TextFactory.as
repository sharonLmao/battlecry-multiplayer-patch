package com.lachhhEngine.multilingual
{
   import com.lachhhEngine.initializers.VersionInfo;
   import flash.utils.ByteArray;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class TextFactory
   {
      
      private static var _instance:TextFactory;
      
      private static var _message:int = 0;
      
      public static var ID_GS_NEED_LOG_TITLE:int = GetNextTextId();
      
      public static var ID_GS_NEED_LOG:int = GetNextTextId();
      
      public static var ID_GS_NEED_FILE_TRANSFERED:int = GetNextTextId();
      
      public static var ID_RANK_1ST:int = GetNextTextId();
      
      public static var ID_RANK_2ND:int = GetNextTextId();
      
      public static var ID_RANK_3RD:int = GetNextTextId();
      
      public static var ID_RANK_TH:int = GetNextTextId();
      
      public static var ID_DATA_SHARED_LOADING_SCORE:int = GetNextTextId();
      
      public static var ID_FB_INVITATION_SUCCESS:int = GetNextTextId();
      
      public static var ID_FB_LIMIT_OF_8:int = GetNextTextId();
      
      public static var ID_X_MORE_TO_GO:int = GetNextTextId();
      
      public static var ID_HOUR:int = GetNextTextId();
      
      public static var ID_MINUTE:int = GetNextTextId();
      
      public static var ID_NEXT_REWARD:int = GetNextTextId();
      
      public static var ID_REWARD_AVAILABLE:int = GetNextTextId();
      
      public static var ID_FB_GIVING_REWARD:int = GetNextTextId();
      
      public static var ID_FB_REWARD_GIVEN_SUCCESS:int = GetNextTextId();
      
      public static var ID_FB_REWARD_GIVEN_ERROR:int = GetNextTextId();
      
      public static var ID_FB_ERROR_NOT_CONNECTED:int = GetNextTextId();
      
      public static var ID_FB_CONNECTING:int = GetNextTextId();
      
      public static var ID_FB_RETRIEVING_FRIEND_SCORE:int = GetNextTextId();
      
      public const LANGUAGE_TR:Language = new Language("TR","Turkish");
      
      private var _textVarDict:Array = new Array();
      
      public const LANGUAGE_FR:Language = new Language("FR","Francais");
      
      public const LANGUAGE_LV:Language = new Language("LV","Latvija");
      
      public const LANGUAGE_RU:Language = new Language("RU","Русский");
      
      public const LANGUAGE_DU:Language = new Language("DU","Nederlands");
      
      public const ALL_TEXT:Array;
      
      public const LANGUAGE_CN:Language = new Language("CN","汉语","Arial Unicode MS");
      
      public const LANGUAGE_ES:Language = new Language("ES","Espanol");
      
      private var _language:Language;
      
      public const LANGUAGE_AR:Language = new Language("AR","العربية","Simplified Arabic");
      
      public const LANGUAGE_JA:Language = new Language("JA","Japanese","Arial Unicode MS");
      
      public const LANGUAGE_EN:Language = new Language("EN","English");
      
      public function TextFactory()
      {
         this.ALL_TEXT = new Array(this.LANGUAGE_FR,this.LANGUAGE_EN,this.LANGUAGE_ES,this.LANGUAGE_TR,this.LANGUAGE_JA,this.LANGUAGE_CN,this.LANGUAGE_RU,this.LANGUAGE_LV,this.LANGUAGE_AR,this.LANGUAGE_DU);
         this._language = this.LANGUAGE_EN;
         super();
         if(_instance != null)
         {
            throw new Error("instance already created");
         }
      }
      
      private static function FindIdFromNameOfVar(nameOfVar:String, pClass:Class) : int
      {
         var i:int = 0;
         var j:int = 0;
         var xml:XML = describeType(pClass);
         var varList:XMLList = xml..variable;
         for(var constList:XMLList = xml..constant; i < varList.length(); )
         {
            if(nameOfVar == varList[i].@name)
            {
               return pClass[varList[i].@name];
            }
            i++;
         }
         while(j < constList.length())
         {
            if(nameOfVar == constList[j].@name)
            {
               return pClass[constList[j].@name];
            }
            j++;
         }
         return -1;
      }
      
      public static function RemoveFromArray(array:Array, elem:Object) : Boolean
      {
         for(var i:int = 0; i < array.length; i++)
         {
            if(array[i] == elem)
            {
               array.splice(i,1);
               return true;
            }
         }
         return false;
      }
      
      public static function get instance() : TextFactory
      {
         return _instance;
      }
      
      private static function FindVarNameFromClass(index:int, pClass:Class) : String
      {
         var i:int = 0;
         var j:int = 0;
         var xml:XML = describeType(pClass);
         var varList:XMLList = xml..variable;
         for(var constList:XMLList = xml..constant; i < varList.length(); )
         {
            if(pClass[varList[i].@name] == index)
            {
               return varList[i].@name;
            }
            i++;
         }
         while(j < constList.length())
         {
            if(pClass[constList[j].@name] == index)
            {
               return constList[j].@name;
            }
            j++;
         }
         return "null";
      }
      
      protected static function GetNextTextId() : int
      {
         return _message++;
      }
      
      public static function CreateInstance(instance:TextFactory) : void
      {
         _instance = instance;
         _instance.Init();
      }
      
      public static function DEBUGGetNameOfVarForI(index:int) : String
      {
         var myChild:String = FindVarNameFromClass(index,Class(getDefinitionByName(getQualifiedClassName(_instance))));
         var me:String = FindVarNameFromClass(index,TextFactory);
         if(myChild == "null")
         {
            return me;
         }
         return myChild;
      }
      
      public static function CropIn(value:int, rangeStart:int, rangeEnd:int) : int
      {
         var result:int = value;
         var diff:int = rangeEnd - rangeStart + 1;
         if(diff <= 0)
         {
            return -1;
         }
         while(result < rangeStart)
         {
            result += diff;
         }
         while(result > rangeEnd)
         {
            result -= diff;
         }
         return result;
      }
      
      private static function DEBUGGetIdFromNameOfVar(nameOfVar:String) : int
      {
         var myChild:int = FindIdFromNameOfVar(nameOfVar,Class(getDefinitionByName(getQualifiedClassName(_instance))));
         var me:int = FindIdFromNameOfVar(nameOfVar,TextFactory);
         if(myChild == -1)
         {
            return me;
         }
         return myChild;
      }
      
      public function GetId(s:String) : int
      {
         if(this._textVarDict[s] != null)
         {
            return this._textVarDict[s];
         }
         return -1;
      }
      
      protected function classToXML(pClass:Class) : XML
      {
         var file:ByteArray = new pClass();
         var str:String = file.readUTFBytes(file.length);
         return new XML(str);
      }
      
      public function FindIdFromMessage(s:String) : int
      {
         var id:int = 0;
         var crntLanguage:Language = null;
         if(s == "" || s == null)
         {
            return -1;
         }
         for(var i:int = 0; i < this.ALL_TEXT.length; i++)
         {
            crntLanguage = this.ALL_TEXT[i];
            id = crntLanguage.FindIdFromText(s);
            if(id != -1)
            {
               return id;
            }
         }
         return -1;
      }
      
      public function NextLanguage() : void
      {
         this.SetLang(1);
      }
      
      public function SetLanguageFromLocale(locale:String) : void
      {
         this.language = this.GetLanguageFromLocale(locale);
         if(this.language == null)
         {
            this.language = this.LANGUAGE_EN;
         }
      }
      
      protected function AddText() : void
      {
         this.LANGUAGE_EN.AddText(ID_GS_NEED_LOG_TITLE,"Warning");
         this.LANGUAGE_EN.AddText(ID_GS_NEED_LOG,"Your game has been saved on GamerSafe. You must log in to continue your game, or any progress you make will be lost.  \nDo you want to log in GamerSafe and continue your game?");
         this.LANGUAGE_EN.AddText(ID_GS_NEED_FILE_TRANSFERED,"Your saved files have been transferred to your Gamer Safe account.");
         this.LANGUAGE_EN.AddText(ID_RANK_1ST,"1st");
         this.LANGUAGE_EN.AddText(ID_RANK_2ND,"2nd");
         this.LANGUAGE_EN.AddText(ID_RANK_3RD,"3rd");
         this.LANGUAGE_EN.AddText(ID_RANK_TH,"th");
         this.LANGUAGE_EN.AddText(ID_DATA_SHARED_LOADING_SCORE,"Loading stuff...");
         this.LANGUAGE_EN.AddText(ID_FB_INVITATION_SUCCESS,"Invitations sent successfully !");
         this.LANGUAGE_EN.AddText(ID_FB_LIMIT_OF_8,"Limit of 8 reached");
         this.LANGUAGE_EN.AddText(ID_X_MORE_TO_GO,"[x] more to go");
         this.LANGUAGE_EN.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_EN.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_EN.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_EN.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_EN.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_EN.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_EN.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward for some weird reason :(.  Please refresh the page and try again.");
         this.LANGUAGE_EN.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to refresh the page and try again.");
         this.LANGUAGE_EN.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_EN.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
         this.LANGUAGE_FR.AddText(ID_GS_NEED_LOG_TITLE,"Attention");
         this.LANGUAGE_FR.AddText(ID_GS_NEED_LOG,"Votre partie été sauvegardée sur GamerSafe et vous devez vous connecter pour continuer votre partie.\nToute partie commencée hors-connexion sera perdue. Voulez-vous vous connecter sur GamerSafe ?");
         this.LANGUAGE_FR.AddText(ID_GS_NEED_FILE_TRANSFERED,"Votre progrès a été transféré sur votre compte GamerSafe");
         this.LANGUAGE_FR.AddText(ID_RANK_1ST,"1er");
         this.LANGUAGE_FR.AddText(ID_RANK_2ND,"2ème");
         this.LANGUAGE_FR.AddText(ID_RANK_3RD,"3ème");
         this.LANGUAGE_FR.AddText(ID_RANK_TH,"ème");
         this.LANGUAGE_FR.AddText(ID_DATA_SHARED_LOADING_SCORE,"Chargement de trucs...");
         this.LANGUAGE_FR.AddText(ID_FB_INVITATION_SUCCESS,"Invitations envoyées avec succès !");
         this.LANGUAGE_FR.AddText(ID_FB_LIMIT_OF_8,"Limite de 8 atteint");
         this.LANGUAGE_FR.AddText(ID_X_MORE_TO_GO,"Encore [x] max");
         this.LANGUAGE_FR.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_FR.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_FR.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_FR.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_FR.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_FR.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_FR.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward :(.  Please try again later.");
         this.LANGUAGE_FR.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to restart the game.");
         this.LANGUAGE_FR.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_FR.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
         this.LANGUAGE_CN.AddText(ID_GS_NEED_LOG_TITLE,"警告");
         this.LANGUAGE_CN.AddText(ID_GS_NEED_LOG,"游戏已经在GamerSafe存档， 登录继续游戏，否则你的任何操作都将不被保存。\n是否登录GamerSafe，继续上次的游戏？");
         this.LANGUAGE_CN.AddText(ID_GS_NEED_FILE_TRANSFERED,"游戏已经在您的Gamesafe账户中保存。");
         this.LANGUAGE_CN.AddText(ID_RANK_1ST,"1st");
         this.LANGUAGE_CN.AddText(ID_RANK_2ND,"2nd");
         this.LANGUAGE_CN.AddText(ID_RANK_3RD,"3rd");
         this.LANGUAGE_CN.AddText(ID_RANK_TH,"th");
         this.LANGUAGE_CN.AddText(ID_DATA_SHARED_LOADING_SCORE,"Loading stuff...");
         this.LANGUAGE_CN.AddText(ID_FB_INVITATION_SUCCESS,"Invitations sent successfully !");
         this.LANGUAGE_CN.AddText(ID_FB_LIMIT_OF_8,"Limit of 8 reached");
         this.LANGUAGE_CN.AddText(ID_X_MORE_TO_GO,"[x] more to go");
         this.LANGUAGE_CN.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_CN.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_CN.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_CN.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_CN.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_CN.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_CN.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward for some weird reason :(.  Please refresh the page and try again.");
         this.LANGUAGE_CN.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to refresh the page and try again.");
         this.LANGUAGE_CN.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_CN.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
         this.LANGUAGE_JA.AddText(ID_GS_NEED_LOG_TITLE,"Warning");
         this.LANGUAGE_JA.AddText(ID_GS_NEED_LOG,"Your game has been saved on GamerSafe. You must log in to continue your game, or any progress you make will be lost.  \nDo you want to log in GamerSafe and continue your game?");
         this.LANGUAGE_JA.AddText(ID_GS_NEED_FILE_TRANSFERED,"Your saved files have been transferred to your Gamer Safe account.");
         this.LANGUAGE_JA.AddText(ID_RANK_1ST,"1st");
         this.LANGUAGE_JA.AddText(ID_RANK_2ND,"2nd");
         this.LANGUAGE_JA.AddText(ID_RANK_3RD,"3rd");
         this.LANGUAGE_JA.AddText(ID_RANK_TH,"th");
         this.LANGUAGE_JA.AddText(ID_DATA_SHARED_LOADING_SCORE,"Loading stuff...");
         this.LANGUAGE_JA.AddText(ID_FB_INVITATION_SUCCESS,"Invitations sent successfully !");
         this.LANGUAGE_JA.AddText(ID_FB_LIMIT_OF_8,"Limit of 8 reached");
         this.LANGUAGE_JA.AddText(ID_X_MORE_TO_GO,"[x] more to go");
         this.LANGUAGE_JA.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_JA.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_JA.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_JA.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_JA.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_JA.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_JA.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward for some weird reason :(.  Please refresh the page and try again.");
         this.LANGUAGE_JA.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to refresh the page and try again.");
         this.LANGUAGE_JA.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_JA.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
         this.LANGUAGE_RU.AddText(ID_GS_NEED_LOG_TITLE,"Warning");
         this.LANGUAGE_RU.AddText(ID_GS_NEED_LOG,"Your game has been saved on GamerSafe. You must log in to continue your game, or any progress you make will be lost.  \nDo you want to log in GamerSafe and continue your game?");
         this.LANGUAGE_RU.AddText(ID_GS_NEED_FILE_TRANSFERED,"Your saved files have been transferred to your Gamer Safe account.");
         this.LANGUAGE_RU.AddText(ID_RANK_1ST,"1st");
         this.LANGUAGE_RU.AddText(ID_RANK_2ND,"2nd");
         this.LANGUAGE_RU.AddText(ID_RANK_3RD,"3rd");
         this.LANGUAGE_RU.AddText(ID_RANK_TH,"th");
         this.LANGUAGE_RU.AddText(ID_DATA_SHARED_LOADING_SCORE,"Loading stuff...");
         this.LANGUAGE_RU.AddText(ID_FB_INVITATION_SUCCESS,"Invitations sent successfully !");
         this.LANGUAGE_RU.AddText(ID_FB_LIMIT_OF_8,"Limit of 8 reached");
         this.LANGUAGE_RU.AddText(ID_X_MORE_TO_GO,"[x] more to go");
         this.LANGUAGE_RU.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_RU.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_RU.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_RU.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_RU.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_RU.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_RU.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward for some weird reason :(.  Please refresh the page and try again.");
         this.LANGUAGE_RU.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to refresh the page and try again.");
         this.LANGUAGE_RU.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_RU.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
         this.LANGUAGE_AR.AddText(ID_GS_NEED_LOG_TITLE,"Warning");
         this.LANGUAGE_AR.AddText(ID_GS_NEED_LOG,"Your game has been saved on GamerSafe. You must log in to continue your game, or any progress you make will be lost.  \nDo you want to log in GamerSafe and continue your game?");
         this.LANGUAGE_AR.AddText(ID_GS_NEED_FILE_TRANSFERED,"Your saved files have been transferred to your Gamer Safe account.");
         this.LANGUAGE_AR.AddText(ID_RANK_1ST,"1st");
         this.LANGUAGE_AR.AddText(ID_RANK_2ND,"2nd");
         this.LANGUAGE_AR.AddText(ID_RANK_3RD,"3rd");
         this.LANGUAGE_AR.AddText(ID_RANK_TH,"th");
         this.LANGUAGE_AR.AddText(ID_DATA_SHARED_LOADING_SCORE,"Loading stuff...");
         this.LANGUAGE_AR.AddText(ID_FB_INVITATION_SUCCESS,"Invitations sent successfully !");
         this.LANGUAGE_AR.AddText(ID_FB_LIMIT_OF_8,"Limit of 8 reached");
         this.LANGUAGE_AR.AddText(ID_X_MORE_TO_GO,"[x] more to go");
         this.LANGUAGE_AR.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_AR.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_AR.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_AR.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_AR.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_AR.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_AR.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward for some weird reason :(.  Please refresh the page and try again.");
         this.LANGUAGE_AR.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to refresh the page and try again.");
         this.LANGUAGE_AR.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_AR.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
         this.LANGUAGE_DU.AddText(ID_GS_NEED_LOG_TITLE,"Warning");
         this.LANGUAGE_DU.AddText(ID_GS_NEED_LOG,"Your game has been saved on GamerSafe. You must log in to continue your game, or any progress you make will be lost.  \nDo you want to log in GamerSafe and continue your game?");
         this.LANGUAGE_DU.AddText(ID_GS_NEED_FILE_TRANSFERED,"Your saved files have been transferred to your Gamer Safe account.");
         this.LANGUAGE_DU.AddText(ID_RANK_1ST,"1st");
         this.LANGUAGE_DU.AddText(ID_RANK_2ND,"2nd");
         this.LANGUAGE_DU.AddText(ID_RANK_3RD,"3rd");
         this.LANGUAGE_DU.AddText(ID_RANK_TH,"th");
         this.LANGUAGE_DU.AddText(ID_DATA_SHARED_LOADING_SCORE,"Loading stuff...");
         this.LANGUAGE_DU.AddText(ID_FB_INVITATION_SUCCESS,"Invitations sent successfully !");
         this.LANGUAGE_DU.AddText(ID_FB_LIMIT_OF_8,"Limit of 8 reached");
         this.LANGUAGE_DU.AddText(ID_X_MORE_TO_GO,"[x] more to go");
         this.LANGUAGE_DU.AddText(ID_HOUR,"Hour(s)");
         this.LANGUAGE_DU.AddText(ID_MINUTE,"Minute(s)");
         this.LANGUAGE_DU.AddText(ID_NEXT_REWARD,"Next Reward in :");
         this.LANGUAGE_DU.AddText(ID_REWARD_AVAILABLE,"New Reward available ! Refresh the game and come back to claim it!");
         this.LANGUAGE_DU.AddText(ID_FB_GIVING_REWARD,"Giving your awesome reward...");
         this.LANGUAGE_DU.AddText(ID_FB_REWARD_GIVEN_SUCCESS,"Reward received successfully !");
         this.LANGUAGE_DU.AddText(ID_FB_REWARD_GIVEN_ERROR,"I couldn\'t give your reward for some weird reason :(.  Please refresh the page and try again.");
         this.LANGUAGE_DU.AddText(ID_FB_ERROR_NOT_CONNECTED,"Can\'t access the server :(.  Try to refresh the page and try again.");
         this.LANGUAGE_DU.AddText(ID_FB_CONNECTING,"Connecting to Facebook\n (You might have to disable your pop-up blocker)...");
         this.LANGUAGE_DU.AddText(ID_FB_RETRIEVING_FRIEND_SCORE,"Looking for friends stuff...");
      }
      
      private function SetLang(mod:int = 1) : void
      {
         var crntLocale:String = null;
         var langEnabled:Array = VersionInfo.languageAvailables;
         if(langEnabled == null || langEnabled.length <= 0)
         {
            return;
         }
         for(var i:int = 0; i < langEnabled.length; i++)
         {
            crntLocale = langEnabled[i];
            if(crntLocale.toLocaleLowerCase() == this.language.locale.toLocaleLowerCase())
            {
               this.SetLanguageFromLocale(langEnabled[CropIn(i + mod,0,langEnabled.length - 1)]);
               break;
            }
         }
      }
      
      public function Init() : void
      {
         var crntLanguage:Language = null;
         var missingText:Array = null;
         var otherLanguages:Array = null;
         this.SetLanguageFromLocale(VersionInfo.defaultLanguage);
         this.BuildTextDict();
         this.AddText();
         for(var i:int = 0; i < this.ALL_TEXT.length; i++)
         {
            crntLanguage = this.ALL_TEXT[i];
            missingText = crntLanguage.Validate(crntLanguage.nbTexts);
            otherLanguages = this.ALL_TEXT.slice();
            RemoveFromArray(otherLanguages,crntLanguage);
            this.ShowMissingTexts(crntLanguage,missingText,otherLanguages);
            crntLanguage.frame = i + 1;
         }
      }
      
      public function PrevLanguage() : void
      {
         this.SetLang(-1);
      }
      
      private function ShowMissingTexts(language:Language, a:Array, otherLanguages:Array) : void
      {
         var j:int = 0;
         var l:Language = null;
         var bFoundEquivalentInOtherLanguage:Boolean = false;
         for(var i:int = 0; i < a.length; i++)
         {
            for(j = 0; j < otherLanguages.length; j++)
            {
               l = otherLanguages[j];
               if(l.HaveText(a[i]))
               {
                  bFoundEquivalentInOtherLanguage = true;
                  trace("WARNING : No text for " + language.locale + " at " + a[i] + " msg : " + l.GetText(a[i]));
                  break;
               }
            }
            if(!bFoundEquivalentInOtherLanguage)
            {
               trace("WARNING : No text for " + language.locale + " at " + a[i] + " var name : " + DEBUGGetNameOfVarForI(a[i]));
            }
            bFoundEquivalentInOtherLanguage = false;
         }
      }
      
      public function get language() : Language
      {
         return this._language;
      }
      
      public function ReplaceTextFromIdOnAllLang(textToFind:String, txtToReplace:String, id:int) : void
      {
         var crntLanguage:Language = null;
         var txt:String = null;
         var newTxt:String = null;
         for(var i:int = 0; i < this.ALL_TEXT.length; i++)
         {
            crntLanguage = this.ALL_TEXT[i];
            if(crntLanguage.HaveText(id))
            {
               txt = crntLanguage.GetText(id);
               newTxt = txt.split(textToFind).join(txtToReplace);
               crntLanguage.ReplaceText(id,newTxt);
            }
         }
      }
      
      private function BuildTextDict() : void
      {
         this.BuildTextDictFromClass(Class(getDefinitionByName(getQualifiedClassName(_instance))));
         this.BuildTextDictFromClass(TextFactory);
      }
      
      public function set language(lang:Language) : void
      {
         this._language = lang;
      }
      
      public function GetLanguageFromLocale(locale:String) : Language
      {
         var l:Language = null;
         if(locale == null)
         {
            return null;
         }
         for(var i:int = 0; i < this.ALL_TEXT.length; i++)
         {
            l = this.ALL_TEXT[i];
            if(l.locale.toLocaleLowerCase() == locale.toLocaleLowerCase())
            {
               return l;
            }
         }
         return null;
      }
      
      public function GetMsg(i:int) : String
      {
         return this._language.GetText(i);
      }
      
      private function BuildTextDictFromClass(pClass:Class) : String
      {
         var i:int = 0;
         var j:int = 0;
         var xml:XML = describeType(pClass);
         var varList:XMLList = xml..variable;
         for(var constList:XMLList = xml..constant; i < varList.length(); )
         {
            this._textVarDict[varList[i].@name] = pClass[varList[i].@name];
            i++;
         }
         while(j < constList.length())
         {
            this._textVarDict[constList[j].@name] = pClass[constList[j].@name];
            j++;
         }
         return "null";
      }
   }
}

