pragma solidity ^0.4.18;

import "./owned.sol";

contract LanguageContract is owned {
    uint i_language_index = 0;
    
    enum LanguageLevel {
        Elementary,
        Intermediate,
        Advanced
    }
    
    struct Language {
        string language;
        LanguageLevel level;
    }
    
    mapping(uint => Language) languageMap;
    
    function getLanguage(uint index) public view returns(string language, LanguageLevel level) {
        if(index <= i_language_index) {
            var languageInfo = languageMap[index];
            
            return (languageInfo.language, languageInfo.level);
        }
    }
    
    function getLanguageIndex() public view returns(uint) {
        return i_language_index;
    }
    
    function addLanguage(string language, LanguageLevel level) public onlyowner returns(uint) {
        languageMap[i_language_index] = Language(language, level);
        
        return i_language_index++;
    }
    
    function updateLanguage(uint index, string language, LanguageLevel level) public onlyowner returns(bool) {
        if(index <= i_language_index) {
            languageMap[index] = Language(language, level);
        
            return true;
        }
        
        return false;
    }
}