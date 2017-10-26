pragma solidity ^0.4.18;

import "./owned.sol";
import "./DateTimeContract.sol";

contract CourseContract is owned, DateTimeContract {
    uint i_course_index = 0;
    
     struct Course {
        string name;
        string firm;
        DateTime date;
    }
    
    mapping(uint => Course) courseMap;
    
    function getCourse(uint index) public view returns(string name, string firm, uint dateMonth, uint dateYear) {
        if(index <= i_course_index) {
            var course = courseMap[index];
            
            return (course.name, course.firm, course.date.month, course.date.year);
        }
    }
    
    function getCourseIndex() public view returns(uint) {
        return i_course_index;
    }
    
    function addCourse(string name, string firm, uint dateMonth, uint dateYear) public onlyowner returns(uint) {
        courseMap[i_course_index] = Course(name, firm, DateTime(dateMonth, dateYear));
        
        return i_course_index++;
    }
    
    function updateCourse(uint index, string name, string firm, uint dateMonth, uint dateYear) public onlyowner returns(bool) {
        if(index <= i_course_index) {
            courseMap[index] = Course(name, firm, DateTime(dateMonth, dateYear));
        
            return true;
        }
        
        return false;
    }
}