import logo from './logo.svg';
import './App.css';

function App() {

  const proverbs = ['밥을 잘 먹자', '야채도 먹자', '요가도 하자'];

  const getRandomIndex = (length) => {
    return parseInt(Math.random() * length);
  }
 
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
          {proverbs[getRandomIndex(proverbs.length)]}
      </header>
    </div>
  );
}

export default App;
