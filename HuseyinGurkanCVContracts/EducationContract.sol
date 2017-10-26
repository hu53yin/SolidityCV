pragma solidity ^0.4.18;

import "./owned.sol";
import "./DateTimeContract.sol";

contract EducationContract is owned, DateTimeContract {
    uint i_education_index = 0;
    
    struct Education {
        string schoolName;
        string degree;
        string field;
        string description;
        DateTime startDate;
        DateTime endDate;
        bool isContinue;
    }
    
    mapping(uint => Education) educationMap;
    
    function getEducation(uint index) public view returns(string schoolName, string degree, string field, string description, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isContinue) {
        if(index <= i_education_index) {
            var education = educationMap[index];
            
            return (education.schoolName, education.degree, education.field, education.description, education.startDate.month, education.startDate.year, education.endDate.month, education.endDate.year, education.isContinue);
        }
    }
    
    function getEducationIndex() public view returns(uint) {
        return i_education_index;
    }
    
    function addEducation(string schoolName, string degree, string field, string description, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isContinue) public onlyowner returns(uint) {
        educationMap[i_education_index] = Education(schoolName, degree, field, description, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isContinue);
        
        return i_education_index++;
    }
    
    function updateEducation(uint index, string schoolName, string degree, string field, string description, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isContinue) public onlyowner returns(bool) {
        if(index <= i_education_index) {
            educationMap[index] = Education(schoolName, degree, field, description, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isContinue);
        
            return true;
        }
        
        return false;
    }
}