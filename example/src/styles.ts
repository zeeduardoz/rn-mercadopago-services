import { StyleSheet } from 'react-native';

export const mainStyles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#ffffff',
    textAlign: 'center',
    paddingVertical: 24,
  },
});

export const hooksStyles = StyleSheet.create({
  container: {
    justifyContent: 'flex-start',
    width: '100%',
    paddingVertical: 32,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#ffffff',
    textAlign: 'center',
  },
  result: {
    fontSize: 14,
    color: '#f5ad42',
    marginVertical: 12,
  },
  button: {
    backgroundColor: '#000000',
    borderRadius: 8,
    padding: 8,
    alignItems: 'center',
  },
});
