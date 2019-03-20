FROM cantinona/eosio-cdt as builder

# Making eosio.cdt latest images
FROM eclipse/cpp_gcc:ubuntu
USER root
COPY --from=builder /usr/local/lib/* /usr/local/lib/
COPY --from=builder /usr/local/eosio.cdt /usr/local/eosio.cdt
USER user
ENV LD_LIBRARY_PATH /usr/local/lib:${LD_LIBRARY_PATH}
ENV PATH /usr/local/eosio.cdt/bin:${PATH}

