
#ifndef INC_002_NODO_H
#define INC_002_NODO_H


template <typename T> class NodoDoble{
    public:

    NodoDoble<T> * siguiente;
    NodoDoble<T> * anterior;
    T * dato;
    NodoDoble(){
        siguiente = nullptr;
        anterior = nullptr;
        this->dato = nullptr;
    }

    NodoDoble(T * dato){
        siguiente = nullptr;
        anterior = nullptr;
        this->dato = dato;
    }
};


#endif //INC_002_NODO_H
