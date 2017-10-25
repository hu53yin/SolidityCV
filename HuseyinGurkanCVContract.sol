pragma solidity ^0.4.15;

contract owned {
    address owner;

    modifier onlyowner() {
        require(msg.sender == owner);
        _;
    }

    function owned() public {
        owner = msg.sender;
    }
}

contract mortal is owned {
    function kill() public constant {
        if (msg.sender == owner)
        selfdestruct(owner);
    }
}

contract HuseyinGurkanCVContract is mortal {
    enum LanguageLevel {
        Elementary,
        Intermediate,
        Advanced
    }
    
    struct Language {
        string language;
        LanguageLevel level;
    }
    
    struct DateTime {
        uint month;
        uint year;
    }
    
    struct Experience {
        string title;
        string companyName;
        DateTime startDate;
        DateTime endDate;
        bool isCurrentJob;
    }
    
    struct Certificate {
        string name;
        string authority;
        string license;
        string url;
        DateTime startDate;
        DateTime expireDate;
        bool isExpirable;
    }
    
    struct Education {
        string schoolName;
        string degree;
        string field;
        string description;
        DateTime startDate;
        DateTime endDate;
        bool isContinue;
    }
    
    struct Skill {
        string name;
        uint level;
    }
    
    struct Project {
        string name;
        string description;
        string url;
    }
    
    struct Course {
        string name;
        string firm;
        DateTime date;
    }
    
    string summary;
    string currentTitle;
    string currentLocation;
    
    uint i_experience_index = 0;
    uint i_certificate_index = 0;
    uint i_education_index = 0;
    uint i_skill_index = 0;
    uint i_project_index = 0;
    uint i_course_index = 0;
    uint i_language_index = 0;
    
    mapping(uint => Experience) experienceMap;
    mapping(uint => Education) educationMap;
    mapping(uint => Certificate) certificateMap;
    mapping(uint => Course) courseMap;
    mapping(uint => Skill) skillMap;
    mapping(uint => Project) projectMap;
    mapping(uint => Language) languageMap;

    function getExperience(uint index) public constant returns(string title, string companyName, uint startDateMonth, 
    uint startDateYear, uint endDateMonth, uint endDateYear, bool isCurrentJob) {
        if(index <= i_experience_index) {
            var experience = experienceMap[index];
            
            return (experience.title, experience.companyName, experience.startDate.month, experience.startDate.year, experience.endDate.month, experience.endDate.year, experience.isCurrentJob);
        }
    }
    
    function getExperienceIndex() public constant returns(uint) {
        return i_experience_index;
    }
    
    function addExperience(string title, string companyName, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isCurrentJob) public payable onlyowner returns(uint) {
        experienceMap[i_experience_index] = Experience(title, companyName, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isCurrentJob);
        
        return i_experience_index++;
    }
    
    function updateExperience(uint index, string title, string companyName, uint startDateMonth, 
    uint startDateYear, uint endDateMonth, uint endDateYear, bool isCurrentJob) public payable onlyowner returns(bool) {
        if(index <= i_experience_index) {
            experienceMap[index] = Experience(title, companyName, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isCurrentJob);
        
            return true;
        }
        
        return false;
    }
    
    function getEducation(uint index) public constant returns(string schoolName, string degree, string field, string description, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isContinue) {
        if(index <= i_education_index) {
            var education = educationMap[index];
            
            return (education.schoolName, education.degree, education.field, education.description, education.startDate.month, education.startDate.year, education.endDate.month, education.endDate.year, education.isContinue);
        }
    }
    
    function getEducationIndex() public constant returns(uint) {
        return i_education_index;
    }
    
    function addEducation(string schoolName, string degree, string field, string description, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isContinue) public payable onlyowner returns(uint) {
        educationMap[i_education_index] = Education(schoolName, degree, field, description, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isContinue);
        
        return i_education_index++;
    }
    
    function updateEducation(uint index, string schoolName, string degree, string field, string description, uint startDateMonth, uint startDateYear, 
    uint endDateMonth, uint endDateYear, bool isContinue) public payable onlyowner returns(bool) {
        if(index <= i_education_index) {
            educationMap[index] = Education(schoolName, degree, field, description, DateTime(startDateMonth, startDateYear), DateTime(endDateMonth, endDateYear), isContinue);
        
            return true;
        }
        
        return false;
    }
    
    function getCertificate(uint index) public constant returns(string name, string authority, string license, string url, uint startDateMonth, uint startDateYear, uint expireDateMonth, uint expireDateYear, bool isExpirable) {
        if(index <= i_certificate_index) {
            var certificate = certificateMap[index];
            
            return (certificate.name, certificate.authority, certificate.license, certificate.url, certificate.startDate.month, certificate.startDate.year, certificate.expireDate.month, certificate.expireDate.year, certificate.isExpirable);
        }
    }
    
    function getCertificateIndex() public constant returns(uint) {
        return i_certificate_index;
    }
    
    function addCertificate(string name, string authority, string license, string url, uint startDateMonth, uint startDateYear, uint expireDateMonth, uint expireDateYear, bool isExpirable) public payable onlyowner returns(uint) {
        certificateMap[i_certificate_index] = Certificate(name, authority, license, url, DateTime(startDateMonth, startDateYear), DateTime(expireDateMonth, expireDateYear), isExpirable);
        
        return i_certificate_index++;
    }
    
    function updateCertificate(uint index, string name, string authority, string license, string url, uint startDateMonth, uint startDateYear, uint expireDateMonth, uint expireDateYear, bool isExpirable) public payable onlyowner returns(bool) {
        if(index <= i_certificate_index) {
            certificateMap[index] = Certificate(name, authority, license, url, DateTime(startDateMonth, startDateYear), DateTime(expireDateMonth, expireDateYear), isExpirable);
        
            return true;
        }
        
        return false;
    }
	
	function getCourse(uint index) public constant returns(string name, string firm, uint dateMonth, uint dateYear) {
        if(index <= i_course_index) {
            var course = courseMap[index];
            
            return (course.name, course.firm, course.date.month, course.date.year);
        }
    }
	
	function getCourseIndex() public constant returns(uint) {
        return i_course_index;
    }
    
    function addCourse(string name, string firm, uint dateMonth, uint dateYear) public payable onlyowner returns(uint) {
        courseMap[i_course_index] = Course(name, firm, DateTime(dateMonth, dateYear));
        
        return i_course_index++;
    }
    
    function updateCourse(uint index, string name, string firm, uint dateMonth, uint dateYear) public payable onlyowner returns(bool) {
        if(index <= i_course_index) {
            courseMap[index] = Course(name, firm, DateTime(dateMonth, dateYear));
        
            return true;
        }
        
        return false;
    }
	
	function getLanguage(uint index) public constant returns(string language, LanguageLevel level) {
        if(index <= i_language_index) {
            var languageInfo = languageMap[index];
            
            return (languageInfo.language, languageInfo.level);
        }
    }
    
    function getLanguageIndex() public constant returns(uint) {
        return i_language_index;
    }
    
    function addLanguage(string language, LanguageLevel level) public payable onlyowner returns(uint) {
        languageMap[i_language_index] = Language(language, level);
        
        return i_language_index++;
    }
    
    function updateLanguage(uint index, string language, LanguageLevel level) public payable onlyowner returns(bool) {
        if(index <= i_language_index) {
            languageMap[index] = Language(language, level);
        
            return true;
        }
        
        return false;
    }
	
	function getProject(uint index) public constant returns(string name, string description, string url) {
        if(index <= i_project_index) {
            var project = projectMap[index];
            
            return (project.name, project.description, project.url);
        }
    }
    
    function getProjectIndex() public constant returns(uint) {
        return i_project_index;
    }
    
    function addProject(string name, string description, string url) public payable onlyowner returns(uint) {
        projectMap[i_project_index] = Project(name, description, url);
        
        return i_project_index++;
    }
    
    function updateProject(uint index, string name, string description, string url) public payable onlyowner returns(bool) {
        if(index <= i_project_index) {
            projectMap[index] = Project(name, description, url);
        
            return true;
        }
        
        return false;
    }
	
	function getSkill(uint index) public constant returns(string name, uint level) {
        if(index <= i_skill_index) {
            var skill = skillMap[index];
            
            return (skill.name, skill.level);
        }
    }
    
    function getSkillIndex() public constant returns(uint) {
        return i_skill_index;
    }
    
    function addSkill(string name, uint level) public payable onlyowner returns(uint) {
        skillMap[i_skill_index] = Skill(name, level);
        
        return i_skill_index++;
    }
    
    function updateSkill(uint index, string name, uint level) public payable onlyowner returns(bool) {
        if(index <= i_skill_index) {
            skillMap[index] = Skill(name, level);
        
            return true;
        }
        
        return false;
    }

    function getAddress() public constant returns(string) {
        return "https://21.co/hussein";
    }

    function getDescription() public constant returns(string) {
        return "Huseyin Gurkan's Blockchain based CV";
    }
    function getTitle() public constant returns(string) {
        return "Huseyin Gurkan's Blockchain based CV";
    }
    function getAuthor() public constant returns(string, string) {
        return ("Huseyin Gurkan", "21.co/hussein");
    }
}
