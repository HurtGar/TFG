from django.contrib.auth import authenticate
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView


class GetToken(APIView):
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        if username is None or password is None:
            return Response({'error': 'Username or password incorrect.'}, status=status.HTTP_404_NOT_FOUND)
        user = authenticate(username=username, password=password)

        if not user:
            return Response({'error': 'Invalid credentials.'}, status=status.HTTP_404_NOT_FOUND)

        token = Token.objects.get(user=user)
        return Response({'token': token.key}, status=status.HTTP_200_OK)
