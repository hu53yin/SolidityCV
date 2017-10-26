pragma solidity ^0.4.18;

import "./owned.sol";

contract ProjectContract is owned {
    uint i_project_index = 0;
    
    struct Project {
        string name;
        string description;
        string url;
    }
    
    mapping(uint => Project) projectMap;
    
    function getProject(uint index) public view returns(string name, string description, string url) {
        if(index <= i_project_index) {
            var project = projectMap[index];
            
            return (project.name, project.description, project.url);
        }
    }
    
    function getProjectIndex() public view returns(uint) {
        return i_project_index;
    }
    
    function addProject(string name, string description, string url) public onlyowner returns(uint) {
        projectMap[i_project_index] = Project(name, description, url);
        
        return i_project_index++;
    }
    
    function updateProject(uint index, string name, string description, string url) public onlyowner returns(bool) {
        if(index <= i_project_index) {
            projectMap[index] = Project(name, description, url);
        
            return true;
        }
        
        return false;
    }
}