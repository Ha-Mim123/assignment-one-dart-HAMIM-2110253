// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
// TODO: Complete the following requirements:

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus; // Placeholder - replace with actual implementation
  }
  
  void processPayment(double amount) {
    // TODO: Process payment
     print("Payment processed: $amount");
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // TODO: Generate report
     return "Monthly report for $employeeName in $department department"; // Placeholder - replace with actual implementation
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;
  
  Employee(this.name, this.id, this.department);
  
  String getJobTitle();
  double getBaseSalary();
  
  void displayInfo() {
    print("$name (ID: $id, Department: $department)");
    print("Job Title: ${getJobTitle()}");
    print("Base Salary: ${getBaseSalary()}");
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;
  
  Manager(String name, String id, String department, this.teamSize) : super(name, id, department);
  
  @override
  String getJobTitle() => "Manager";

  @override
  double getBaseSalary() => 8000.0;

  void displayInfo() {
    print("Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)");
  }

}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;
  
  Developer(String name, String id, String department, this.programmingLanguage) : super(name, id, department);
  
   @override
  String getJobTitle() => "Senior Developer";

  @override
  double getBaseSalary() => 6000.0;

  void displayInfo() {
    print(
        "Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)");
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //    - Salary calculation with bonus
  //    - Payment processing
  //    - Report generation (for managers)
  //    - Display all employee information
  
  // TODO: Create employees
  final manager = Manager("John Smith", "M001", "IT", 5);
  final dev = Developer("Alice Johnson", "D001", "IT", "Dart");

  manager.displayInfo();
  print("Job Title: ${manager.getJobTitle()}");
  final mBase = manager.getBaseSalary();
  print("Base Salary: $mBase");
  final mCalculated = manager.calculateSalary(mBase, 1000.0);
  print("Calculated Salary: $mCalculated");
  manager.processPayment(mCalculated);
  print("Report: ${manager.generateReport(manager.name, manager.department)}");

  print(""); // spacer

  // --- Developer section ---
  dev.displayInfo();
  print("Job Title: ${dev.getJobTitle()}");
  final dBase = dev.getBaseSalary();
  print("Base Salary: $dBase");
  final dCalculated = dev.calculateSalary(dBase, 500.0);
  print("Calculated Salary: $dCalculated");
  dev.processPayment(dCalculated);
}