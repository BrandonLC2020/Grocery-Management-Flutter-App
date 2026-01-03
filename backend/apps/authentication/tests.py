from django.test import TestCase
from django.contrib.auth import get_user_model

class UserManagerTestCase(TestCase):
    def test_create_superuser(self):
        User = get_user_model()
        user = User.objects.create_superuser('test@example.com', 'testuser', 'password')
        self.assertIsNotNone(user)
        self.assertTrue(user.is_superuser)
        self.assertTrue(user.is_staff)
