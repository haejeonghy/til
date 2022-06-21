# Introduction

* 자바스크립트 기반으로 개선된 언어
* 더 나은 개발자 경험 제공
* 타입스크립트가 왜 등장했는가? 
  * 타입 안정성이 좋다.
    * 타입 스크립트 장점을 이용하기 좋다. 
    * 개발하기 좋다. 
    * 코드에서 버그가 줄어든다. 
    * 런타임 에러가 줄어든다. 
    * 생산성이 늘어난다.

## Overview

* How Typescript Works
  * 타입스크립트의 경우 작성한 코드를 컴파일해 자바스크립트로 변환된다. 
  * 노드는 타입스크립트와 자바스크립트 모두 이해할 수 있다. 
  * 타입스크립트로 작성한 코드에서 에러가 발생하면 컴파일 전에 에러가 발견된다. 
    * 에러가 있으면 컴파일 되지 않는다.
    * 컴파일 된다면 정상적인 코드이다. 

## Implicit Types vs Explicit Types

* 데이터와 변수 타입을 명시적으로 정의할 수 있다.
* 자바스크립트처럼 변수만 생성하고 넘어갈 수 있다. 
  * 타입을 추론해준다. 

```ts
let a = "hello" // typescript가 타입을 추천해준다. (string)
a = "bye" // string to string 변환 괜찮다.  
a = 1 // 에러 발생 : a가 string 이기 때문에 숫자를 넣을 수 없다. 

let b : boolean = true // 변수에 타입 명시 (권장하는 방식)
let c : number[] = [] // 배열 타입 지정
b = "x" // 에러 발생
b = false // 가능
```

## Types of TS

* number, string, boolean, array
* object 타입 지정

```ts
const player : {
    name: string,
    age?: number    // optional 나이가 있거나 없거나 사용 가능하다
} = {
    name = "nico"
}

if(player.age < 10) { // 에러 발생 (age가 undefined 일 수 있다)

}
```
```ts
type Age = number;
type Player = { // alias 타입
    name: string,
    age?: number // Age 가능
}

const playerGang : Player = {
    name:"song gang"
}

const playerHyun : Player = {
    name: "dohyun",
    age:20
}

function playerMaker(name:string) : Player{ // Player 타입 리턴한다는 명시
    return {
        name:name // name 도 가능
    }
}

const nico = playerMaker("nico") // 정상 작동

const playerMaker = (name:string) : Player => ({name}) // 함수로 선언 (Player) 타입 리턴
```
* 타입스크립트에서는 readonly 기능을 지원한다.
```ts
type Player = {
    readonly name:Name // 변경하려고 하면 에러가 발생한다. 
    age?:age
}
nico.age = 12
nico.name = "tes" // 에러 발생

const numbers: readonly number[] = [1, 2, 3, 4] // readonly 가능
numbers.push(1) // 에러 발생
```
* Tuple
  * 최소 갯수, 특정 위치에 특정 타입이 있어야 한다. 
  * 자바스크립트에서는 지원하지 않는다. 
```ts
const player: [string, number, boolean] = [] // 3 요소가 필요한데 없으면 에러가 발생한다.
const player: [string, number, boolean] = ["nico", 1, true] // 가능하다
player[0] = 1 // 불가능하다 
const player: readonly [string, number, boolean] = ["nico", 1, true] // readonly 사용 가능
```
* undefined, null 가능
* any
```ts
type Player = {
    age?:number // number or undefined
}
let a = [] // let a: any[] 형식이 지정되지 않는 타입 (사용을 권장하지 않는다.)
```
* void, never, unknown
```ts
let a: unknown;  // 어떤 작업을 하려면 변수의 타입을 명시해야 한다. 
let b = a+1; // 에러 발생 (a의 타입을 체크해야 한다.)
if (typeof a === 'number') { // 타입 체크 후 작업 (정상 작동))
    let b = a + 1
}

function hello() { // 리턴 타입이 없을 경우 void (따로 지정해줄 필요는 없다)
    console.log('x')
}
const a = hello();
a.toUpperCase() // 에러 발생(void 타입이기 때문에)

never // 함수가 절대 리턴하지 않는 경우
function hello(): never {
    return 'X' // 에러 발생 (리턴하지 않기 떄문에)
    throw new Error('xxx') // 에러 발생은 정상 작동한다. 
}

function hello(name:string|number) { // name은 string일수도, number일수도 있다. 

}
```

## Functions

* call signatures
  * 함수를 어떻게 호출해야 하는지 명시
  * 어떻게 구현하는게 아니라 함수의 반환 타입과 파라미터 타입을 명시한다. 
```ts
const add = (a:number, b:number) => a + b
// call signature  const add: (a:number, b: number) => number

type Add = (a: number, b: number) => number // call signature 만들기
const add:Add = (a, b) => a + b // a, b 가 Number라고 명시할 필요가 없다. 
const add:Add = (a, b) => { a + b } // void는 리턴할 수 없다는 에러 발생 (중괄호 넣으면 void 타입 됨)
```
* overloading
  * 실제로 많은 오버로딩 함수를 사용하지 않는다. 
  * 대부분의 시간을 다른 사람들이 만든 오버로딩을 많이 사용한다. 
    * 그냥 들었을 때 복잡하다고 느낄 수 있다. 
  * 여러개의 콜 시그니처가 있을 때 발생한다. 
```ts
type Add = (a: number, b: number) => number 
// 위와 같다
type Add = {
    (a: number, b: number) : number
}

// 여러개의 
type Add = { // 둘 중 하나일 수 있다
// 여러개의 콜 시그니처가 있는 함수
    (a: number, b: number) : number
    (a: number, b: string) : number
}
const add: Add = (a, b) => a + b // 에러가 발생한다. b가 string, number 둘 다 되기 때문에
const add: Add = (a, b) => { // 정상 작동하나 권장하지 않는다.
    if(typeof b === 'string') return a
    return a + b
}


type Config = {
    path:string,
    state:object
}
type Push = {
    (path:string):void
    (config:Config):void
}
// 
const push:Push = (config) => {
    if(typeof config === 'string') console.log(config)
    console.log(config.path) // object로 들어올 때 사용할 수 있다. 
}
```
```ts
type Add = {
    // 파라미터 개수가 다른 경우 
    (a:number, b:number):number
    (a: number, b:number, c:number): number; // c 파라미터는 옵션
}
// 에러 발생
const add:Add = (a, b, c) => {
    return a + b 
}

// c를 옵션 처리함 (정상 작동)
const add:Add = (a, b, c?:number) => {
    if(c) return a + b + c
    return a + b 
}
add(1, 2)
add(1,2,3) // 모두 정상 작동
```
* Polymorphism
  * 다형성
  * multi shape
* generics
  * placeholder와 유사하다
  * 들어올 확실한 타입을 모를때 제네릭을 사용한다. 

```ts
// 배열을 확인하기
// call signature
type SuperPrint = {
    (arr: number[]):void // number 외의 다양한 타입도 받으려면
    // 타입 스크립트에게 제네릭 타입을 받을 거라고 명시 (TypePlaceholder 외에 potato도 된다)
    <TypePlaceholder>(arr: TypePlaceholder[]):void
    // 타입스크립트가 발견한 타입으로 처리한다 
}
const superPrint: SuperPrint = (arr) => {
    arr.forEach(i => console.log(i))
}

type SuperPrint = {
    (arr: number[]):void // number 외의 다양한 타입도 받으려면
    // 타입 스크립트에게 제네릭 타입을 받을 거라고 명시 (TypePlaceholder 외에 potato도 된다)
    <TypePlaceholder>(arr: TypePlaceholder[]):TypePlaceholder
    // 타입스크립트가 발견한 타입으로 처리한다 
}
// 어떤 타입이든 받아서 어떤 타입이든 첫 번째를 리턴한다
const superPrint: SuperPrint = (arr) => arr[0]{

}
```
* Generics Recap

```ts
type SuperPrint = (a:T[]) => T
const superPrint: SuperPrint = (a) => a[0]
// 이렇게 만들면 타입스크립트가 들어가는 데이터 타입을 예상하고 규정한다. 
// 요청만 하면 call signature를 만들 수 있다. 

type SuperPrint = <T, M>(a:T[], b:M) => T
// 제네릭이 처음 만들어질 떄  타입이 정해진다. 
const superPrint: SuperPrint = (a) => a[0]
// T는 첫 파라미터로 배열이 올 것이다
// M은 두 번째 파라미터로 배열이 들어간다. 
// 타입스크립트가 이걸 해석한다. 
```
* 제네릭을 직접 사용할 일은 잘 없다. 
  * 라이브러리를 사용할 때 라이브러리에 이렇게 제네릭으로 만들어진게 있다.

```ts
// 제네릭 사용하겠다고 명시
function superPrint<T>(a:T[]){
    return a[0]
}
const a = superPrint<boolean>([1, 2, 3, 4]) // 에러 발생 오버로딩하는 경우


type Player<E> = {
    name:string,
    extraInfo:E// 무슨 타입이든 받을 수 있다
}

const nico: Player<{favFood:string}> = {
    name:"nico",
    extraInfo: {
        favFood:"kimchi"
    }
}
type NicoPlayer = Player<{favFood:string}>
type NicoExtra = {
    favFood:string
}
type NicoPlayer = Player<NicoExtra>

const lynn: Player <null> // extra 가 null인 경우
const lynn: Player<null> = {
    name: "nico",
    
}

// 자주 쓰이는 제네릭 사용
type arrNumbers = Array<number> // 어레이 만들 때 타입 지정
let a: A = [1, 2, 3, 4]

function printAllNumbers(arr: Array<number>){

}
```

## CLASSES AND INTERFACES

* classes

```ts
class Player {
    // 파라미터를 쓰면 자동으로 this.firstName set 해준다. 
    constructor (
        // 타입스크립트가 보호하기 위해 사용한다. 
        private firstName:string, // javascript에선 private가 사용되지 않는다. 
        private lastName:string,
        public nickname:string
    ){}
}

const nico = new Player("nico", "las", "니꼬")
nico.firstName  // 에러 발생
nico.nickname // 접근 가능
```
```ts
// 다른 클래스가 상속받을 수 있는 클래스
abstract class User {
        constructor (
        // 타입스크립트가 보호하기 위해 사용한다. 
            private firstName:string, // javascript에선 private가 사용되지 않는다. 
            private lastName:string,
            public nickname:string
    ){}
    // 추상메소드를 만들려면 구현을 추상 클래스 안에서 만들어야 한다. 
    // 상속 받는 인스턴스들이 구현해야 한다. 
    abstract getNickname():void

    getFullName() {
        return `${this.firstName} ${this.lastName}`
    }
}

new User() // 이렇게 생성할 수 없다. 에러 발생
// 상속 받아서 새 인스턴스를 만들 수 있다. 
class Player extends User {
    //abstract 메소드를 구현해야 한다. 
    getNickname() {
        // 상속받은 private 필드에 접근할 수 없다. 
        console.log(this.nickname) //에러가 발생한다 - private 이기 때문에
        //protected로 지정된 데이터는 접근 가능하다. 
    }
}
const nico = new Player("nico","las","니꼬")
nico.getFullName()// private으로 바꾸면 에러가 발생한다.
```
```ts
// Words 타입은 string을 프로퍼티로 가지는 오브젝트
type Words = {
    [key:string]: string
}

let dict: Words = {
    "potato":"food"
}

class Dict {
    private words: Words // 이거만 넣으면 에러가 발생한다 (initialize 없음)
    constructor() {
        this.words = {} // initialize 
    }
    add(word:Word){
        // 사전에 값이 있는지 확인하고 추가하기 
        if(this.words[word.term] === undefined) {
            this.words[word.term] = word.def;
        }
    }
    def(term:string){
        return this.words[term]
    }
}
class Word {
    constructor(
        public term:string, 
        public def:string
    ){}
}
const kimchi = new Word("kimchi","한국 음식")
const dict = new Dict();
dict.add(kimchi);
dict.def("kimchi")// 
```
* Interfaces
  * 필드를 readonly로 설정하면 수정할 수 없음. 
  * type을 사용하는게 편하다. 
```ts
type Player = {
    nickname:string,
    healthBar:number
}
const nico:Player = {
    nickname:"nico",
    healthBar:10
}
type Food = string

const kimchi:Food = "delicious"

type Nickname = string
type Health =-number
type Friends = Array<string>
type Player = {
    nickname:Nickname,
    healthBar:Health
}
const nico:Player = {
    nickname:"nico"

}
// string 특정 스트링으로 제한
type Team = "red" | "blue" | "yellow"

type Player = {
    nickname:string,
    team:Team
}

const nico: Player = {
    nickname:"nico",
    team:"pink", // 에러 발생
}
```
```ts
// type은 다양한 용도로 사용된다. 
type Team = "red" | "blue" | "yellow"
type Health = 1 | 5 | 10
// 오브젝트 모양을 특정하기 위해 사용한다. 
interface Player {
    nickname:string,
    team:Team,
    health:Health
}
const nico : Player = {
    nickname:"nico",
    team:"red",
    health:10
}
```
```ts
interface User {
    name:string
}
// class와 유사하게 생겼다. 
interface Player extends User {

}
const nico : Player = {
    name:"nico"
}
```
```ts
// 컴파일하면 JS에서 사라진다
interface User {
    name:string
}
interface User {
    lastname:string
}
// 인터페이스를 여러개 만들어도 합쳐준다. 
const nico: User = {
    name: "nico"
    lastname:"las"
}
```
```ts
// 고유한 사용처가 있다. 
// 클래스의 모양을 만들어준다.
// abstract 처럼 컴파일되지 않느낟. 
// private property를 사용할 수 없다. 
interface User {
    firstName:string,
    lastName:string,
    sayHi(name:string):string
    fullName():string
}
interface Human {
    health:number
}
// js에선 나타나지 않는다. 
// 여러개를 상속받을 수 있다. 
// 타입으로 지정할 수 있다. 
class Player implements User, Human {
    constructor(
        public firstName:string,
        public lastName:string,
        public health: number
    ){}
    fullName() {
        return `${this.firstName} ${this.lastName}`
    }
    sayHi(name:string) {
        return `Hello ${name} my name is ${this.fullName}!`
    }
}
// 인터페이스를 타입으로 받거나 인터페이스를 리턴할 수 있다. 
function makerUser(user:User) {
    return "hi"
}
makeUser({
    firstName:"nico",
    lastname:"las"
})
function makerUser(user:User):User {
    return {
        firstName:"nico" 
        ... 
    }
}
```
* Polymorphism
  * 다른 모양의 코드를 가질 수 있게 해주는 것
  * 제네릭을 사용해서 placeholder type을 가지게 한다. 
  * 데이터가 들어가면 타입스크립트가 placeholder에 들어가게 한다. 

```ts
// 타입스크립트에 의해 미리 선언된 자바스크립트 웹 스토리지 API를 위한 인터페이스
interface Storage {

}
interface SStorage {
    [key:string]:T 
}
//<T> 를 물려줄 수 있다. 
class LocalStorage<T>{
    private storage:SStorage<T> = {

    } 
    set(key:string, value:T){
        this.storage[key] = value
    }
    remove(key:string){
        delete this.storage[key]
    }
    get(key:string):T{
        return this.storage[key]
    }
    clear(){
        this.storage = {}
    }
}

// string 타입 로컬 스토리지
const stringsStorage = new LocalStorage<string>()
stringStorage.get("key")

const booleanStorage = new LocalStorage<boolean>()
booleanStorage.get("xxx" )// return boolean
```
## Typescript 프로젝트 세팅
* 보통 프레임워크가 자동으로 해준다.
* mkdir typeChain
* code typeChain
* npm init -y
* package.json main 삭제
* npm i -D typescript
* mkdir src
* index.ts 파일 생성
  * const hello = () => "hi"
* touch tsconfig.json
* code tsconfig.json
```json
{
    'include':["src"],
    'compilerOptions': {
        // 자바스크립트 파일이 생길 자리
        "outDir":"build"
    }
}
```
* package.json
  * npm run build trc
  * "target":"ES6" -> 화살표 생기게 하려면 이 버전 이상 사용해야 함
* index.js
* tsconfig.json
  * lib
    * 정의 파일의 목표로 하는 런타임 정해준다. 