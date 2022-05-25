import 'package:app_costura/app/modules/clients/domain/entities/client_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final client = Client(
    id: 1,
    name: "client",
    phone: "(41)999999999",
    bust: 1,
    bustHeight: 2,
    waist: 3,
    hip: 4,
    shoulderWidth: 5,
    sleeveLenght: 6,
    inseam: 7,
    biceps: 8,
    pants: 9,
  );

  const clientName = "Test Client";
  final clientDefaultValue = Client(id: 2, name: clientName);

  test('Client should have ID property', () {
    expect(client.id.runtimeType, int);
  });

  test('Client should have NAME property', () {
    expect(client.name.runtimeType, String);
  });

  test('Client should have PHONE property', () {
    expect(client.phone.runtimeType, String);
  });

  test('Client should have BUST property', () {
    expect(client.bust.runtimeType, int);
  });

  test('Client should have BUST HEIGHT property', () {
    expect(client.bustHeight.runtimeType, int);
  });

  test('Client should have WAIST property', () {
    expect(client.waist.runtimeType, int);
  });

  test('Client should have HIP property', () {
    expect(client.hip.runtimeType, int);
  });

  test('Client should have SHOULDER WIDTH property', () {
    expect(client.shoulderWidth.runtimeType, int);
  });

  test('Client should have SLEEVE LENGHT property', () {
    expect(client.sleeveLenght.runtimeType, int);
  });

  test('Client should have INSEAM property', () {
    expect(client.inseam.runtimeType, int);
  });

  test('Client should have BICEPS property', () {
    expect(client.biceps.runtimeType, int);
  });

  test('Client should have PANTS LENGHT property', () {
    expect(client.pants.runtimeType, int);
  });

  test('PHONE property should have default value = ""', () {
    expect(clientDefaultValue.phone, "");
  });

  test('BUST property should have default value = 0', () {
    expect(clientDefaultValue.bust, 0);
  });

  test('BUST HEIGHT property should have default value = 0', () {
    expect(clientDefaultValue.bustHeight, 0);
  });

  test('WAIST property should have default value = 0', () {
    expect(clientDefaultValue.waist, 0);
  });

  test('HIP property should have default value = 0', () {
    expect(clientDefaultValue.hip, 0);
  });

  test('SHOULDER WIDTH property should have default value = 0', () {
    expect(clientDefaultValue.shoulderWidth, 0);
  });

  test('SLEEVE LENGHT property should have default value = 0', () {
    expect(clientDefaultValue.sleeveLenght, 0);
  });

  test('INSEAM property should have default value = 0', () {
    expect(clientDefaultValue.inseam, 0);
  });

  test('BICEPS property should have default value = 0', () {
    expect(clientDefaultValue.biceps, 0);
  });

  test('PANTS property should have default value = 0', () {
    expect(clientDefaultValue.pants, 0);
  });
}
