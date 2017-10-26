pragma solidity ^0.4.18;

import "./owned.sol";

contract SkillContract is owned {
    uint i_skill_index = 0;
    
    struct Skill {
        string name;
        uint level;
    }
    
    mapping(uint => Skill) skillMap;
    
    function getSkill(uint index) public view returns(string name, uint level) {
        if(index <= i_skill_index) {
            var skill = skillMap[index];
            
            return (skill.name, skill.level);
        }
    }
    
    function getSkillIndex() public view returns(uint) {
        return i_skill_index;
    }
    
    function addSkill(string name, uint level) public onlyowner returns(uint) {
        skillMap[i_skill_index] = Skill(name, level);
        
        return i_skill_index++;
    }
    
    function updateSkill(uint index, string name, uint level) public onlyowner returns(bool) {
        if(index <= i_skill_index) {
            skillMap[index] = Skill(name, level);
        
            return true;
        }
        
        return false;
    }
}