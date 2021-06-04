from unittest import TestCase

import requests


class TestGetAuthToken(TestCase):

    environment = 'http://192.168.1.50:8000/'

    requestOK = {
        'username': 'miguel@gmail.com',
        'firstSurname': 'Miguel',
        'email': 'miguel@gmail.com',
        'password': 'miguel',
    }

    requestKO = {
        'username': 'miguel@gmail.com',
        'firstSurname': 'Miguel',
        'email': 'miguel@gmail.com',
        'password': 'prueba',
    }

    requestNone = None

    def test_getAuthToken_shouldReturn_requestIsNotNone(self):
        if self.requestOK is not None:
            self.assertIsNotNone(self.requestOK)

    def test_getAuthToken_shouldReturn_requestIsNone(self):
        if self.requestNone is None:
            self.assertIsNone(self.requestNone)


    def test_getAuthToken_shouldReturn_code200OK(self):
        response = requests.post(self.environment+"get_token",self.requestOK)
        assert response.status_code == 200


    def test_getAuthToken_shouldReturn_code401Unauthorized(self):
        response = requests.post(self.environment+"get_token", self.requestKO)
        assert response.status_code == 401

