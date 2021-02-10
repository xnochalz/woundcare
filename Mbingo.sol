pragma solidity >=0.5.0 <0.6.0;
contract WoundCare {

  event NewPatient(uint patientId, string name, uint dna);

  uint PatientID 
  state woundstate;
  
  struct Patient {
    string name;
    string DateofClinicVisit
    uint Weight;
    uint32 BMI;
    string AnatomicLocation;
    string WoundView;
    string xtentofTissueLoss
    uint16 patientCount;
    uint16 visitCount;
  }

  Patient[] public patients;

  mapping (address => uint) patientCount;

  function _addPatient(string memory _name, uint _dna) internal {
    uint id = patients.push(Patient(_name, _dna, 1, uint32(now ), 0, 0)) - 1;
    patientCount[msg.sender]++;
    emit NewZombie(id, _name, _dna);
  }

  function _generateReport(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % PatientID;
  }

  function woundassesment(string memory _name) public {
    require(patientCount[msg.sender] == 0);
    uint newpatient = _generateRandomDna(_name);
    newpatient = newpatient - newpatient % 100;
    _addPatient(_name, newpatient);
  }

}
