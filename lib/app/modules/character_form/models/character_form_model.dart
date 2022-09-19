import 'package:zodrac/app/utils/functions.dart';

class CharacterFormModel {
  Name _name = Name('');
  void setName(String newName) => _name = Name(newName);
  Name get name => _name;

  Gender _gender = Gender('');
  void setGender(String newGender) => _gender = Gender(newGender);
  Gender get gender => _gender;

  BirthDate _birthDate = BirthDate('');
  void setBirthDate(String newBirthDate) =>
      _birthDate = BirthDate(newBirthDate);
  BirthDate get birthDate => _birthDate;

  String? validate() {
    String? validate = _gender.validate();
    if (validate != null) {
      return validate;
    }
    validate = _name.validate();
    if (validate != null) {
      return validate;
    }
    return null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': _name.value,
      'gender': _gender.value,
      'birthDate': _birthDate.value,
    };
  }
}

class Gender {
  Gender(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo gênero não pode ser vazio';
    }
    return null;
  }
}

class Name {
  Name(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo nome não pode ser vazio';
    }
    if (value.trim().length < 3 || value.trim().length > 20) {
      return 'O nome deve conter no mínimo 6 caracteres e no máximo 20 caracteres';
    }
    if (!isName(value)) {
      return 'O nome pode conter letras, números e caractere underscore separando a cada letra, o primeiro e último caractere deve ser alfanuméricos';
    }
    return null;
  }
}

class BirthDate {
  BirthDate(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo data de nascimento não pode ser vazio';
    }
    return null;
  }
}
