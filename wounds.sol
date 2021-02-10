pragma solidity >=0.5.0 <0.6.0;
contract WoundCare {

  event NewPatient(uint patientId, string name, uint dna);

  uint PatientID;
  
  struct Patient {
    string name;
    string DateofClinicVisit;
    uint BMI;
    string AnatomicLocation;
    string WoundView;
    string xtentofTissueLoss;
    uint patientCount;
    uint visitCount;
  }

  Patient[] public patients;

  mapping (address => uint) patientCount;

  function _addPatient(string memory _name, uint _BMI) internal {
    uint id = patients.push(Patient(_name, _BMI, , , , , )) - 1;
    patientCount[msg.sender]++;
    emit NewPatient(id, _name, _BMI);
  }

  function _generateReport(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % PatientID;
  }

  function woundassesment(string memory _name) public {
    require(patientCount[msg.sender] == 0);
    uint newpatient = _generateReport(_name);
    newpatient = newpatient - newpatient % 100;
    _addPatient(_name, newpatient);
  }

}
