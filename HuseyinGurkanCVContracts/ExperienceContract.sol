pragma solidity ^0.4.18;

import "./owned.sol";
import "./DateTimeContract.sol";

contract ExperienceContract is owned, DateTimeContract {
    uint i_experience_index = 0;
    
    struct Experience {
        string title;
        string companyName;
        DateTime startDate;
        DateTime endDate;
        bool isCurrentJob;
    }
    
    mapping(uint => Experience) experienceMap;
    
    function getExperience(uint index) public view returns(string title, string companyName, uint startDateMonth, 
    uint startDateYear, uint endDateMonth, uint endDateYear, bool isCurrentJob) {
        if(index <= i_experience_index) {
            var experience = experienceMap[index];
            
            return (experience.title, experience.companyName, experience.startDate.month, experience.startDate.year, experience.endDate.month, experience.endDate.year, experience.isCurrentJob);
        }
    }
    
    function getExperienceIndex() public view returns(uint) {
        return i_experience_index;
    }
    
    function addExperience(string title, string companyName, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isCurrentJob) public onlyowner returns(uint) {
        experienceMap[i_experience_index] = Experience(title, companyName, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isCurrentJob);
        
        return i_experience_index++;
    }
    
    function updateExperience(uint index, string title, string companyName, uint startDateMonth, 
    uint startDateYear, uint endDateMonth, uint endDateYear, bool isCurrentJob) public onlyowner returns(bool) {
        if(index <= i_experience_index) {
            experienceMap[index] = Experience(title, companyName, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isCurrentJob);
        
            return true;
        }
        
        return false;
    }
}