pragma solidity ^0.4.18;

import "./mortal.sol";
import "./CertificateContract.sol";
import "./CourseContract.sol";
import "./EducationContract.sol";
import "./ExperienceContract.sol";
import "./LanguageContract.sol";
import "./ProjectContract.sol";
import "./SkillContract.sol";

contract HuseyinGurkanCVContract is mortal, CertificateContract, CourseContract, EducationContract,
ExperienceContract, LanguageContract, ProjectContract, SkillContract {
    string summary;
    string currentTitle;
    string currentLocation;
    
    function getAddress() public pure returns(string) {
        return "21.co/hussein";
    }

    function getDescription() public pure returns(string) {
        return "Huseyin Gurkan's Blockchain based CV";
    }
    function getTitle() public pure returns(string) {
        return "Huseyin Gurkan's Blockchain based CV";
    }
    function getAuthor() public pure returns(string, string) {
        return ("Huseyin Gurkan", "21.co/hussein");
    }
}