function Student(firstName, lastName){
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function(){
  return `${this.firstName} ${this.lastName}`;
};


Student.prototype.courses = function(){
  return this.courses;
};

Student.prototype.enroll = function(course){
  for(let i = 0; i < this.courses.length; i++){
    if (this.courses[i] == course){
      return;
    }
    this.courses.push(course);
    course.students.push(this);
  }
};

Student.prototype.course_load = function(){
  departments = {};
  this.courses.forEach((el) => departments[el.department] += el.credits);
  return departments;
};

function Course(name, department, credits){
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

Course.prototype.students = function(){
  return this.students;
};

Course.prototype.addStudent = function(student){
  student.enroll();
};
