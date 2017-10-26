pragma solidity ^0.4.18;

import "./owned.sol";
import "./DateTimeContract.sol";

contract CertificateContract is owned, DateTimeContract {
    uint i_certificate_index = 0;
    
    struct Certificate {
        string name;
        string authority;
        string license;
        string url;
        DateTime startDate;
        DateTime expireDate;
        bool isExpirable;
    }
    
    mapping(uint => Certificate) certificateMap;
    
    function getCertificate(uint index) public view returns(string name, string authority, string license, string url, uint startDateMonth, uint startDateYear, uint expireDateMonth, uint expireDateYear, bool isExpirable) {
        if(index <= i_certificate_index) {
            var certificate = certificateMap[index];
            
            return (certificate.name, certificate.authority, certificate.license, certificate.url, certificate.startDate.month, certificate.startDate.year, certificate.expireDate.month, certificate.expireDate.year, certificate.isExpirable);
        }
    }
    
    function getCertificateIndex() public view returns(uint) {
        return i_certificate_index;
    }
    
    function addCertificate(string name, string authority, string license, string url, uint startDateMonth, uint startDateYear, uint expireDateMonth, uint expireDateYear, bool isExpirable) public onlyowner returns(uint) {
        certificateMap[i_certificate_index] = Certificate(name, authority, license, url, DateTime(startDateMonth, startDateYear), DateTime(expireDateMonth, expireDateYear), isExpirable);
        
        return i_certificate_index++;
    }
    
    function updateCertificate(uint index, string name, string authority, string license, string url, uint startDateMonth, uint startDateYear, uint expireDateMonth, uint expireDateYear, bool isExpirable) public onlyowner returns(bool) {
        if(index <= i_certificate_index) {
            certificateMap[index] = Certificate(name, authority, license, url, DateTime(startDateMonth, startDateYear), DateTime(expireDateMonth, expireDateYear), isExpirable);
        
            return true;
        }
        
        return false;
    }
}